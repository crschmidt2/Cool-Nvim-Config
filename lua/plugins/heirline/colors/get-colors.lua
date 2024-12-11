local color_hl = require('plugins.commons.color.hl')
local str = require('plugins.commons.str')
local tbl = require('plugins.commons.tbl')
local color_hsl = require('plugins.commons.color.hsl')

-- Clamps the val between left and right
local function clamp(val, left, right)
  if val > right then
    return right
  end
  if val < left then
    return left
  end
  return val
end

-- Turns { red, green, blue } -> #rrggbb
local function rgb_num2str(rgb_color_num)
  local rgb_color_str =
      string.format("#%02x%02x%02x", rgb_color_num.red, rgb_color_num.green, rgb_color_num.blue)
  return rgb_color_str
end

-- Turns #rrggbb -> { red, green, blue }
local function rgb_str2num(rgb_color_str)
  if rgb_color_str:find("#") == 1 then
    rgb_color_str = rgb_color_str:sub(2, #rgb_color_str)
  end
  local r = tonumber(rgb_color_str:sub(1, 2), 16)
  local g = tonumber(rgb_color_str:sub(3, 4), 16)
  local b = tonumber(rgb_color_str:sub(5, 6), 16)
  return { red = r, green = g, blue = b }
end

-- Convert RGB color code into HSL color object.
local function rgb_to_hsl(rgb)
  local h, s, l = color_hsl.rgb_string_to_hsl(rgb)
  return color_hsl.new(h, s, l, rgb)
end

-- Darker/lighter RGB color code with a 0.0 ~ 1.0 parameter.
--
--- @param rgb string The RGB color code.
--- @param value number The 0.0 ~ 1.0 parameter.
local function shade_rgb(rgb, value)
  if vim.o.background == "light" then
    return rgb_to_hsl(rgb):tint(value):to_rgb()
  else
    return rgb_to_hsl(rgb):shade(value):to_rgb()
  end
end

-- Get RGB color code from `g:terminal_color_0` ~ `g:terminal_color_10`, or fallback to default color.
--- @param number integer
--- @param fallback string
--- @return string
local get_terminal_color = function(number, fallback)
  local color_name = string.format("terminal_color_%d", number)
  local color = vim.g[color_name]
  if str.not_empty(color) then
    return color
  else
    return fallback
  end
end

local retrieve_color = function(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    mode_name,
    section,
    attribute,
    fallback_hls,
    fallback_attribute,
    fallback_color
)
  local air_section = "airline_" .. section
  local air_attribute = attribute == "fg" and 1 or 2
  local air_mode_name = mode_name == "command" and "terminal" or mode_name

  --- @type string
  local result
  --- @type "lualine"|"airline"|"fallback"
  local source

  if has_lualine and tbl.tbl_get(lualine_theme, mode_name, section, attribute) then
    result = lualine_theme[mode_name][section][attribute]
    source = "lualine"
  elseif has_airline and tbl.tbl_get(airline_theme, air_mode_name, air_section, air_attribute) then
    ---@diagnostic disable-next-line: need-check-nil
    result = airline_theme[air_mode_name][air_section][air_attribute]
    source = "airline"
  end

  if type(result) ~= "string" then
    result = color_hl.get_color_with_fallback(fallback_hls, fallback_attribute, fallback_color) --[[@as string]]
    source = "fallback"
  end

  return result, source
end

-- Returns brightness level of color in range 0 to 1
-- arbitrary value it's basically an weighted average
local get_color_brightness = function(rgb_color)
  local color = rgb_str2num(rgb_color)
  local brightness = (color.red * 2 + color.green * 3 + color.blue) / 6
  return brightness / 256
end

-- Changes brightness of rgb_color by percentage
local brightness_modifier = function(rgb_color, percentage)
  local color = rgb_str2num(rgb_color)
  color.red = clamp(color.red + (color.red * percentage / 100), 0, 255)
  color.green = clamp(color.green + (color.green * percentage / 100), 0, 255)
  color.blue = clamp(color.blue + (color.blue * percentage / 100), 0, 255)
  return rgb_num2str(color)
end


---@param colorname string?
---@return table<string, string>
return function(colorname)
  local shade_level1 = 0.3
  local shade_level2 = 0.5
  local shade_level3 = 0.7

  local diagnostic_error =
      color_hl.get_color_with_fallback({ "DiagnosticSignError", "ErrorMsg" }, "fg", red)
  local diagnostic_warn =
      color_hl.get_color_with_fallback({ "DiagnosticSignWarn", "WarningMsg" }, "fg", yellow)
  local diagnostic_info =
      color_hl.get_color_with_fallback({ "DiagnosticSignInfo", "None" }, "fg", cyan)
  local diagnostic_hint =
      color_hl.get_color_with_fallback({ "DiagnosticSignHint", "Comment" }, "fg", grey)
  local git_add = color_hl.get_color_with_fallback(
    { "GitSignsAdd", "GitGutterAdd", "diffAdded", "DiffAdd" },
    "fg",
    green
  )
  local git_change = color_hl.get_color_with_fallback(
    { "GitSignsChange", "GitGutterChange", "diffChanged", "DiffChange" },
    "fg",
    yellow
  )
  local git_delete = color_hl.get_color_with_fallback(
    { "GitSignsDelete", "GitGutterDelete", "diffRemoved", "DiffDelete" },
    "fg",
    red
  )
  local git_ahead = get_terminal_color(3, yellow)
  local git_behind = get_terminal_color(3, yellow)
  local git_dirty = get_terminal_color(1, magenta)

  local text_bg, text_fg
  local normal_bg, normal_fg
  local normal_bg1, normal_fg1
  local normal_bg2, normal_fg2
  local normal_bg3, normal_fg3
  local normal_bg4, normal_fg4
  local insert_bg, insert_fg
  local visual_bg, visual_fg
  local replace_bg, replace_fg
  local command_bg, command_fg

  -- The `lualine` is the most popular statusline plugin in Neovim community.
  -- The `airline` is the one of the most popular statusline plugin in Vim community.
  -- Both of them provide a way to integrate with third-party colorschemes.
  --
  -- See:
  -- * [lualine doc - SETTING A THEME](https://github.com/nvim-lualine/lualine.nvim/blob/544dd1583f9bb27b393f598475c89809c4d5e86b/doc/lualine.txt#L178-L205)
  -- * [lualine wiki - Writing a theme](https://github.com/nvim-lualine/lualine.nvim/wiki/Writing-a-theme)
  -- * [airline doc - WRITING THEMES](https://github.com/vim-airline/vim-airline/blob/02894b6ef4752afd8579fc837aec5fb4f62409f7/doc/airline.txt#L2099-L2111)
  --
  -- So if a colorscheme provides either lualine or airline theme, let's directly use them.
  -- Since they're carefully designed by the author of the colorscheme.

  -- If current colorscheme provides a lualine theme.
  local has_lualine, lualine_theme = pcall(require, string.format("lualine.themes.%s", colorname))

  -- If current colorscheme provides an airline theme.
  local has_airline = false
  local airline_theme_name = string.format("airline#themes#%s#palette", colorname)
  local airline_theme = nil
  if not has_lualine and vim.fn.exists("g:" .. airline_theme_name) > 0 then
    has_airline = true
    vim.cmd("let heirline_tmp=g:" .. airline_theme_name)
    airline_theme = vim.g[airline_theme_name]
  end

  -- Retrieve RGB color from lualine/airline, or fallback to a highlighting group, or fallback to a default color.
  text_bg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "normal",
    "a",
    "bg",
    { "Normal" },
    "bg",
    black
  )
  text_fg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "normal",
    "a",
    "fg",
    { "Normal" },
    "fg",
    white
  )
  -- print(string.format("text bg/fg:%s/%s", vim.inspect(text_bg), vim.inspect(text_fg)))

  -- local normal_bg_derives = derive_rgb(get_terminal_color(0, magenta), 6)
  local normal_bg_source

  normal_bg, normal_bg_source = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "normal",
    "a",
    "bg",
    { "StatusLine", "PmenuSel", "PmenuThumb", "TabLineSel" },
    "bg",
    get_terminal_color(0, magenta)
  )
  normal_fg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "normal",
    "a",
    "fg",
    {},
    "fg",
    text_bg -- or black
  )
  normal_bg1 = normal_bg
  normal_fg1 = normal_fg

  normal_bg2 = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "normal",
    "b",
    "bg",
    {},
    "bg",
    shade_rgb(get_terminal_color(0, magenta), shade_level1)
  )
  normal_fg2 = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "normal",
    "b",
    "fg",
    {},
    "fg",
    text_fg -- or white
  )
  normal_bg3 = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "normal",
    "c",
    "bg",
    {},
    "bg",
    shade_rgb(get_terminal_color(0, magenta), shade_level2)
  )
  normal_fg3 = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "normal",
    "c",
    "fg",
    {},
    "fg",
    text_fg -- or white
  )
  if normal_bg_source ~= "fallback" then
    normal_bg4 = shade_rgb(normal_bg3, shade_level1)
  else
    normal_bg4 = shade_rgb(get_terminal_color(0, magenta), shade_level3)
  end
  normal_fg4 = normal_fg3

  -- print(string.format("1-normal source:%s", vim.inspect(normal_bg_source)))

  insert_bg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "insert",
    "a",
    "bg",
    { "String", "MoreMsg" },
    "fg",
    get_terminal_color(2, green)
  )
  insert_fg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "insert",
    "a",
    "fg",
    {},
    "fg",
    text_bg
  )
  visual_bg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "visual",
    "a",
    "bg",
    { "Special", "Boolean", "Constant" },
    "fg",
    get_terminal_color(3, yellow)
  )
  visual_fg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "visual",
    "a",
    "fg",
    {},
    "fg",
    text_bg
  )
  replace_bg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "replace",
    "a",
    "bg",
    { "Number", "Type" },
    "fg",
    get_terminal_color(4, blue)
  )
  replace_fg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "replace",
    "a",
    "fg",
    {},
    "fg",
    text_bg
  )
  command_bg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "command",
    "a",
    "bg",
    { "Identifier" },
    "fg",
    get_terminal_color(1, red)
  )
  command_fg = retrieve_color(
    has_lualine,
    lualine_theme,
    has_airline,
    airline_theme,
    "command",
    "a",
    "fg",
    {},
    "fg",
    text_bg
  )
  -- print(string.format("1-text bg/fg:%s/%s", vim.inspect(text_bg), vim.inspect(text_fg)))

  if not has_lualine and not has_airline then
    local background_color = color_hl.get_color("Normal", "bg")
    if background_color then
      local parameter = get_color_brightness(background_color) > 0.5 and -10 or 10
      normal_bg = brightness_modifier(normal_bg, parameter)
      normal_bg1 = normal_bg
      if get_color_brightness(normal_bg1) < 0.5 then
        normal_fg = text_fg
        normal_fg1 = text_fg
      end

      -- local normal_bg_derives2 = derive_rgb(normal_bg1, 6)
      -- print(
      --   string.format(
      --     "2-normal source:%s, derives2:%s",
      --     vim.inspect(normal_bg_source),
      --     vim.inspect(normal_bg_derives2)
      --   )
      -- )
      -- print(string.format("normal bg derives2:%s", vim.inspect(normal_bg_derives2)))
      normal_bg2 = shade_rgb(normal_bg, shade_level1)
      if get_color_brightness(normal_bg2) > 0.5 then
        normal_fg2 = text_bg
      end
      normal_bg3 = shade_rgb(normal_bg, shade_level2)
      if get_color_brightness(normal_bg3) > 0.5 then
        normal_fg3 = text_bg
      end
      normal_bg4 = shade_rgb(normal_bg, shade_level3)
      if get_color_brightness(normal_bg4) > 0.5 then
        normal_fg4 = text_bg
      end
      -- print(string.format("2-text bg/fg:%s/%s", vim.inspect(text_bg), vim.inspect(text_fg)))
      -- print(
      --   string.format(
      --     "text bg/fg:%s/%s, normal bg1/fg1:%s/%s,bg2/fg2:%s/%s,bg3/fg3:%s/%s,bg4/fg4:%s/%s",
      --     vim.inspect(text_bg),
      --     vim.inspect(text_fg),
      --     vim.inspect(normal_bg1),
      --     vim.inspect(normal_fg1),
      --     vim.inspect(normal_bg2),
      --     vim.inspect(normal_fg2),
      --     vim.inspect(normal_bg3),
      --     vim.inspect(normal_fg3),
      --     vim.inspect(normal_bg4),
      --     vim.inspect(normal_fg4)
      --   )
      -- )

      -- normal_bg2 = shade_rgb(normal_bg, 0.5)
      -- if get_color_brightness(normal_bg2) > 0.5 then
      --   normal_fg2 = text_bg
      -- end
      -- normal_bg3 = shade_rgb(normal_bg, shade_level2)
      -- if get_color_brightness(normal_bg3) > 0.5 then
      --   normal_fg3 = text_bg
      -- end
      -- normal_bg4 = shade_rgb(normal_bg, shade_level3)
      -- if get_color_brightness(normal_bg4) > 0.5 then
      --   normal_fg4 = text_bg
      -- end

      insert_bg = brightness_modifier(insert_bg, parameter)
      if get_color_brightness(insert_bg) < 0.5 then
        insert_fg = text_fg
      end
      visual_bg = brightness_modifier(visual_bg, parameter)
      if get_color_brightness(visual_bg) < 0.5 then
        visual_fg = text_fg
      end
      replace_bg = brightness_modifier(replace_bg, parameter)
      if get_color_brightness(replace_bg) < 0.5 then
        replace_fg = text_fg
      end
      command_bg = brightness_modifier(command_bg, parameter)
      if get_color_brightness(command_bg) < 0.5 then
        command_fg = text_fg
      end
    end
  end

  return {
    text_bg = text_bg,
    text_fg = text_fg,
    black = black,
    white = white,
    red = red,
    green = green,
    blue = blue,
    cyan = cyan,
    grey = grey,
    orange = orange,
    yellow = yellow,
    purple = purple,
    magenta = magenta,
    bright_black = bright_black,
    bright_red = bright_red,
    bright_green = bright_green,
    bright_yellow = bright_yellow,
    bright_blue = bright_blue,
    bright_magenta = bright_magenta,
    bright_cyan = bright_cyan,
    bright_white = bright_white,
    normal_bg1 = normal_bg1,
    normal_fg1 = normal_fg1,
    normal_bg2 = normal_bg2,
    normal_fg2 = normal_fg2,
    normal_bg3 = normal_bg3,
    normal_fg3 = normal_fg3,
    normal_bg4 = normal_bg4,
    normal_fg4 = normal_fg4,
    insert_bg = insert_bg,
    insert_fg = insert_fg,
    visual_bg = visual_bg,
    visual_fg = visual_fg,
    replace_bg = replace_bg,
    replace_fg = replace_fg,
    command_bg = command_bg,
    command_fg = command_fg,
    diagnostic_error = diagnostic_error,
    diagnostic_warn = diagnostic_warn,
    diagnostic_info = diagnostic_info,
    diagnostic_hint = diagnostic_hint,
    git_add = git_add,
    git_change = git_change,
    git_delete = git_delete,
    git_ahead = git_ahead,
    git_behind = git_behind,
    git_dirty = git_dirty,
  }
end
