local conditions = require("heirline.conditions")

local Align = { provider = "%=" }
local Space = { provider = " " }
local Rule = { provider = " | ", hl = { fg = "indent_blankline" } }

local BaseDirectory = require('plugins.heirline.components.base-directory')

local DefaultWinBar = {
  BaseDirectory
}

-- local SpecialWinBar = {
--   condition = false,
-- }

return {
  condition = function()
    return not conditions.buffer_matches({
      buftype = { 'nofile', 'prompt' } }
    )
  end,
  hl = function()
    local foreground = ""
    if conditions.is_active() then
      foreground = "status_line_fg"
    else
      foreground = "status_line_inactive_fg"
    end

    local background = ""
    if conditions.is_active() then
      background = "status_line_bg"
    else
      background = "status_line_inactive_bg"
    end
    return {
      fg = foreground,
      bg = background
    }
  end,

  fallthrough = false,
  -- SpecialWinBar,
  DefaultWinBar
}
