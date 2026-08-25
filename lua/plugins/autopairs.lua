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
                    :with_pair(function(options)
                        local line = options.line
                        local col = options.col
                        return not line:sub(col, col):match("|")
                    end)
                    :with_move(function(options)
                        return options.char == "|"
                    end)
                    :use_key("|")
            })
        end
    },
    {
        'windwp/nvim-ts-autotag',
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            per_filetype = {
                ["razor"] = {
                    enable_close = true
                }
            }
        },
        config = function()
            require('nvim-ts-autotag').setup(opts)
        end
    }
}
