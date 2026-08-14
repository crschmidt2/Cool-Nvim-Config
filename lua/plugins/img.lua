return {
    "3rd/image.nvim",
    enabled = function ()
       return not require("lib.utils").is_on_windows()
    end,
    build = false,
    event = "VeryLazy",
    opts = {
        processor = "magick_cli",
    }
}
