return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function(_, _)
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")

            npairs.setup({
                check_ts = true,
            })


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
    {
        'windwp/nvim-ts-autotag',
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    }
}
