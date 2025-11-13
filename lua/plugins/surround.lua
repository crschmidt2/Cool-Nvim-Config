return {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {
        surrounds = {
            ["("] = {
                add = { "(", ")" },
            },
            ["{"] = {
                add = { "{", "}" },
            },
            ["["] = {
                add = { "[", "]" },
            },
        }

    },
    config = function(_, opts)
        require("nvim-surround").setup(opts)
    end
}
