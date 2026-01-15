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
            ---@type table<string, snacks.win.Config>
            styles = {
                input = {
                    position = "bottom",
                }
            }
        },
    }
}
