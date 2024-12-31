-- use to get possible colors: lua vim.print(require('plugins.heirline.colors.get-colors')(require('themery').getCurrentTheme().name))

return {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  config = function()
    local utils = require("heirline.utils")
    local setup_colors = require('plugins.heirline.colors.get-colors')

    --Components
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
        colors = setup_colors()
      }
    })



    --Makes it so colorscheme reloads on change
    vim.api.nvim_create_augroup("Heirline", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        utils.on_colorscheme(setup_colors)
      end,
      group = "Heirline",
    })
  end
}
