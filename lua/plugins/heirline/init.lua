-- use to get possible colors: lua vim.print(require('plugins.heirline.colors.get-colors')(require('themery').getCurrentTheme().name))


return {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  config = function()
    local heirline_colors = require('plugins.heirline.colors')
    local StatusLine = require('plugins.heirline.statusline')

    local WinBar = nil
    local TabLine = nil
    local StatusColumn = nil

    require("heirline").setup({
      statusline = StatusLine,
      winbar = WinBar,
      tabline = TabLine,
      statuscolumn = StatusColumn,
      opts = {
        colors = heirline_colors.defaults()
      }
    })
  end
}
