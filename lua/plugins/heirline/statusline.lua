-- local osLogo = require("plugins.heirline.components.os-logo")
local viMode = require("plugins.heirline.components.vi-mode")

local fileName = {
  provider = "%f",
  -- hl = {
  --   fg = "purple",
  --   bg = "default_bg",
  -- }
}


return {
  -- osLogo,
  viMode,
  fileName
}
