local conditions = require("heirline.conditions")

local Align = { provider = "%=" }
local Space = { provider = " " }
local Rule = { provider = " | ", hl = { fg = "indent_blankline" } }

local ViMode = require("plugins.heirline.components.vi-mode")
local FileName = require("plugins.heirline.components.filename")
local LspStatus = require("plugins.heirline.components.lsp-status")
local Diagnostics = require("plugins.heirline.components.diagnostics")
local Git = require("plugins.heirline.components.git-info")
local MacroRec = require("plugins.heirline.components.macro-recording")
local TerminalName = require("plugins.heirline.components.terminal-name")

local DefaultStatusLine = {
  ViMode,
  Space,
  FileName,
  Space,
  MacroRec,
  Align,
  Git,
  { Rule, condition = Git.condition },
  Diagnostics,
  { Rule, condition = Diagnostics.condition },
  LspStatus
}

local EmptyFileStatusLine = {
  ViMode,
  Space,
  FileName,
  Space,
  MacroRec,
  Align,
  Git,
  condition = function()
    return not conditions.buffer_matches({
      bufname = { '.' }
    })
  end
}

local InactiveStatusLine = {
  ViMode,
  Space,
  FileName,
  Space,
  MacroRec,
  Align,
  Git,
  condition = conditions.is_not_active,
}

local TerminalStatusLine = {
  ViMode,
  Space,
  TerminalName,
  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end
}


return {
  condition = function()
    return not conditions.buffer_matches({
      buftype = { 'nofile' } }
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
  TerminalStatusLine,
  InactiveStatusLine,
  EmptyFileStatusLine,
  DefaultStatusLine
}
