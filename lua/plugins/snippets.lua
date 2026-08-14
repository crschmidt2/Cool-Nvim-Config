return {
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = {
            { "rafamadriz/friendly-snippets" },
            { "saadparwaiz1/cmp_luasnip" }
        },
        opts = function()
            return {
                load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft({
                    typescript = { "angular" },
                    -- html = { "angular" },
                    -- htmlangular = { "angular", "html" },
                }),
            }
        end,
        config = function(_, opts)
            local ls = require("luasnip")

            vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })

            ls.setup(opts)

            ls.filetype_extend("typescript", { "angular" })
            ls.filetype_extend("html", { "angular" })
            ls.filetype_extend("htmlangular", { "angular", "html" })

            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
}
