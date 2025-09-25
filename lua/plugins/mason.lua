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
        opts = {
            automatic_enable = {
                ensure_installed = { "lua_ls", "rust_analyzer", "vtsls", "vue_ls" },
                exclude = {
                    "ts_ls",
                    "vtsls",
                    "vue_ls",
                    --LSP Setup handled by roslyn.nvim
                    "roslyn"
                }
            }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
            require("core.lspconfig")
        end
    }
}
