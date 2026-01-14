return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            input = {
                enabled = true,
                prompt_pos = "left"
            },
            styles = {
                input = {
                    position = "bottom",
                }
            }
        },
    }
}
