return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {},
        config = function(_, opts)
            -- fold defaults: open files unfolded rather than fully collapsed
            vim.o.foldlevelstart = 99

            vim.api.nvim_create_autocmd('FileType', {
                desc = 'Treesitter highlighting, folds, and indentation',
                callback = function(args)
                    local buf = args.buf
                    local ft = vim.bo[buf].filetype
                    -- resolves aliases, e.g. filetype 'sh' -> parser 'bash'
                    local lang = vim.treesitter.language.get_lang(ft) or ft

                    -- fails (harmlessly) when no parser is installed for this filetype
                    if not pcall(vim.treesitter.start, buf, lang) then
                        return
                    end

                    -- window-local, but scoped to this buffer via the [win][buf] indexing
                    vim.wo[0][0].foldmethod = 'expr'
                    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'

                    -- optional; still experimental upstream
                    -- vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            require('nvim-treesitter').setup()
            require('nvim-treesitter').install { 'vim', 'vimdoc', 'javascript', 'typescript', 'rust', 'c_sharp', 'nix', 'markdown', 'json', 'css', 'html', 'luadoc', 'vue' }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            vim.g.no_plugin_maps = true
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup {
                select = {
                    lookahead = true,
                    selection_modes = {
                        ['@parameter.outer'] = 'v',
                        ['@function.outer'] = 'v',
                    },
                    include_surrounding_whitespace = false,
                },
                move = {
                    set_jumps = true
                }
            }

            local textobjects = {
                {
                    key = "f",
                    object = "@function",
                },
                {
                    key = "c",
                    object = "@class",
                },
                {
                    key = "p",
                    object = "@parameter",
                },
            }

            for _, value in ipairs(textobjects) do
                --AROUND AND INSIDE KEYBINDS
                vim.keymap.set({ "x", "o" }, "a" .. value.key, function()
                    require "nvim-treesitter-textobjects.select".select_textobject(value.object .. ".outer",
                        "textobjects")
                end)
                vim.keymap.set({ "x", "o" }, "i" .. value.key, function()
                    require "nvim-treesitter-textobjects.select".select_textobject(value.object .. ".inner",
                        "textobjects")
                end)

                --JUMP [] KEYBINDS
                vim.keymap.set({ "n", "x", "o" }, "]" .. value.key, function()
                    require("nvim-treesitter-textobjects.move").goto_next_start(value.object .. ".outer", "textobjects")
                end)
                vim.keymap.set({ "n", "x", "o" }, "]" .. string.upper(value.key), function()
                    require("nvim-treesitter-textobjects.move").goto_next_end(value.object .. ".outer", "textobjects")
                end)
                vim.keymap.set({ "n", "x", "o" }, "[" .. value.key, function()
                    require("nvim-treesitter-textobjects.move").goto_previous_start(value.object .. ".outer",
                        "textobjects")
                end)
                vim.keymap.set({ "n", "x", "o" }, "[" .. string.upper(value.key), function()
                    require("nvim-treesitter-textobjects.move").goto_previous_end(value.object .. ".outer", "textobjects")
                end)
            end
        end,
    }
}
