return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {
            map_cr = true,
        },
        config = function(_, opts)
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")

            npairs.setup(opts)

            --Rust closures
            npairs.add_rules({
                Rule("|", "|", "rust")
                    :with_pair(function(opts)
                        local line = opts.line
                        local col = opts.col
                        return not line:sub(col, col):match("|")
                    end)
                    :with_move(function(opts)
                        return opts.char == "|"
                    end)
                    :use_key("|")
            })
        end
    },
    -- {
    --     'nvim-mini/mini.pairs',
    --     version = false,
    --     opts = {},
    --     config = function()
    --         require('mini.pairs').setup()
    --     end
    -- },
    {
        'windwp/nvim-ts-autotag',
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    }
}
