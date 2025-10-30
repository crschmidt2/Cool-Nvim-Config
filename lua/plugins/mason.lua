return {
    --MASON: Package manager for language servers
    {
        "williamboman/mason.nvim",
        cmd = { "Mason" },
        opts = {
            registries = {
                'github:mason-org/mason-registry',
                --ROSLYN and RAZOR LS
                'github:crashdummyy/mason-registry',
            }
        },
        config = function(_, opts)
            require('mason').setup(opts)
        end
    },
    --Mason LSPConfig
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            automatic_enable = {
                ensure_installed = { "lua_ls", "rust_analyzer", "html_lsp", "css_lsp", "ts_ls", "vue_ls", "js_debug_adapter", "netcoredbg" },
                exclude = {
                    "lua_ls",
                    "ts_ls",
                    "vtsls",
                    "vue_ls",
                    --LSP Setup handled by roslyn.nvim
                    "roslyn"
                }
            }
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
            require("core.lsp")
        end
    }
}
