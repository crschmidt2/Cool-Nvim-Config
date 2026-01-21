return { {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    event = { "BufReadPost", "BufReadPre", "BufNewFile", "BufWritePre" },
    -- lazy = vim.fn.argc(-1) == 0,
    build = ":TSUpdate",
    branch = "master",
    version = false,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
        { "<c-space>", desc = "Increment Selection" },
        { "<bs>",      desc = "Decrement Selection", mode = "x" },
    },
    opts = {
        ensure_installed = { "lua", "luadoc", "markdown", "json", "vimdoc", "javascript", "typescript", "rust", "c_sharp", "vue", "html", "css", "cpp", "printf", "vim", "vimdoc" },
        highlight = { enable = true, use_languagetree = true },
        indent = { enable = false },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<A-o>",
                node_incremental = "<A-o>",
                scope_incremental = "<A-p>",
                node_decremental = "<A-i>",
            },
        },
    },
    config = function(_, opts)
        require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
        require 'nvim-treesitter.configs'.setup(opts)
        vim.filetype.add({
            pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
        })

        -- CLASSIC ASP HIGHLIGHTING
        vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
            callback = function()
                if vim.opt.filetype:get() == 'aspvbs' then
                    vim.api.nvim_command('set ft=vb')
                end
            end
        })
    end
},
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        event = { "BufReadPost", "BufReadPre", "BufNewFile", "BufWritePre" },
        config = function(_, opts)
            require 'nvim-treesitter.configs'.setup {
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["ip"] = "@parameter.inner",
                            ["ap"] = "@parameter.outer",
                        },
                        include_surrounding_whitespace = true,
                    }
                }
            }
        end
    }
}
