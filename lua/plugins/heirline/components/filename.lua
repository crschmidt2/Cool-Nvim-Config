local utils = require("heirline.utils")
local conditions = require("heirline.conditions")
local Space = { provider = " " }
local FileIcon = require("plugins.heirline.components.file-icon")

local FileNameAndIconBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    if not conditions.is_active() then self.icon_color = "gray" end
  end
}


local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end

    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end
}

FileNameAndIconBlock = utils.insert(FileNameAndIconBlock, FileIcon, FileName)

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "",
    hl = { fg = "orange" },
  },
}

return {
  FileNameAndIconBlock,
  Space,
  FileFlags,
  {
    provider = "%<" -- this means that the statusline is cut here when there's not enough space
  }
}
