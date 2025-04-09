return {
  {
    "hedyhli/outline.nvim",
    keys = {
      { "<C-c>", "<cmd>Outline<CR>", desc = "Open symbol tree" }
    },
    cmd = { "Outline", "OutlineOpen" },
    event = 'VeryLazy',
    opts = {
      outline_window = {
        position = 'left',
        relative_width = false,
        width = 30,
        winhl = 'EndOfBuffer:NvimTreeEndOfBuffer,Normal:NvimTreeNormal',
        auto_close = true
      },
      outline_items = {
        auto_set_cursor = false,
        highlight_hovered_item = false,
      },
      keymaps = {
        show_help = '?',
        close = 'q',
        goto_location = '<Cr>',
        fold_toggle = 'o'
      }
    },
    config = function(_, opts)
      require('outline').setup(opts)
    end,
  }
}
