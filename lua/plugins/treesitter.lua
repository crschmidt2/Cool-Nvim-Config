return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    build = ":TSUpdate",
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
                -- init_selection = "<C-space>",
                -- node_incremental = "<C-space>",
                -- node_decremental = "<bs>",
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
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
}
