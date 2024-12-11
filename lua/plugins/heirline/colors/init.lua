-- ALL THIS "AUTO-GENERATE COLORSCHEME" CODE IS TAKEN FROM LINRONGBIN16 COMMONS.NVIM AND NVIM DOTFILES. IT IS
-- BASED OFF OF LUALINE AUTO THEME CODE
--
-- I put this simple table return in its own file so you can easily see the name of the colors that get returned

local get_colors = require('plugins.heirline.colors.get-colors')

local heirline_colors = {}

heirline_colors.is_custom_highlighted = false

heirline_colors.defaults = function()
  local generated_colors = get_colors(vim.g.colors_name)
  return {
    text_bg = generated_colors.text_bg,
    text_fg = generated_colors.text_fg,
    black = generated_colors.black,
    white = generated_colors.white,
    red = generated_colors.red,
    green = generated_colors.green,
    blue = generated_colors.blue,
    cyan = generated_colors.cyan,
    grey = generated_colors.grey,
    orange = generated_colors.orange,
    yellow = generated_colors.yellow,
    purple = generated_colors.purple,
    magenta = generated_colors.magenta,
    bright_black = generated_colors.bright_black,
    bright_red = generated_colors.bright_red,
    bright_green = generated_colors.bright_green,
    bright_yellow = generated_colors.bright_yellow,
    bright_blue = generated_colors.bright_blue,
    bright_magenta = generated_colors.bright_magenta,
    bright_cyan = generated_colors.bright_cyan,
    bright_white = generated_colors.bright_white,
    normal_bg1 = generated_colors.normal_bg1,
    normal_fg1 = generated_colors.normal_fg1,
    normal_bg2 = generated_colors.normal_bg2,
    normal_fg2 = generated_colors.normal_fg2,
    normal_bg3 = generated_colors.normal_bg3,
    normal_fg3 = generated_colors.normal_fg3,
    normal_bg4 = generated_colors.normal_bg4,
    normal_fg4 = generated_colors.normal_fg4,
    insert_bg = generated_colors.insert_bg,
    insert_fg = generated_colors.insert_fg,
    visual_bg = generated_colors.visual_bg,
    visual_fg = generated_colors.visual_fg,
    replace_bg = generated_colors.replace_bg,
    replace_fg = generated_colors.replace_fg,
    command_bg = generated_colors.command_bg,
    command_fg = generated_colors.command_fg,
    diagnostic_error = generated_colors.diagnostic_error,
    diagnostic_warn = generated_colors.diagnostic_warn,
    diagnostic_info = generated_colors.diagnostic_info,
    diagnostic_hint = generated_colors.diagnostic_hint,
    git_add = generated_colors.git_add,
    git_change = generated_colors.git_change,
    git_delete = generated_colors.git_delete,
    git_ahead = generated_colors.git_ahead,
    git_behind = generated_colors.git_behind,
    git_dirty = generated_colors.git_dirty,
  }
end

return heirline_colors
