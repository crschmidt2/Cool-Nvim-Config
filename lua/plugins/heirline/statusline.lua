local conditions = require("heirline.conditions")

local ViMode = require("plugins.heirline.components.vi-mode")
local FileName = require("plugins.heirline.components.filename")
local LspStatus = require("plugins.heirline.components.lsp-status")
local Diagnostics = require("plugins.heirline.components.diagnostics")

local Align = { provider = "%=" }
local Space = { provider = " " }


local DefaultStatusLine = {
  ViMode,
  Space,
  FileName,
  Align,
  LspStatus,
  -- Diagnostics
}

local InactiveStatusLine = {
  ViMode,
  Space,
  FileName,
  condition = conditions.is_not_active,
}

return {
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
  InactiveStatusLine,
  DefaultStatusLine
}
