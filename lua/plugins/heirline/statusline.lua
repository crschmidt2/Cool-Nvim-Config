local conditions = require("heirline.conditions")

local ViMode = require("plugins.heirline.components.vi-mode")

local FileName = {
  provider = "%f",
  -- hl = {
  --   fg = "purple",
  --   bg = "default_bg",
  -- }
}

local Align = { provider = "%=" }
local Space = { provider = " " }


local DefaultStatusLine = {
  ViMode,
  Space,
  FileName
}

local InactiveStatusLine = {
  ViMode,
  Space,
  FileName,
  condition = conditions.is_not_active,
}


return {

hl = function()
        if conditions.is_active() then
            return "StatusLine"
        else
            return "StatusLineNC"
        end
    end,

  fallthrough = false,
  InactiveStatusLine, DefaultStatusLine
}
