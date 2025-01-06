local utils = require("heirline.utils")
local conditions = require("heirline.conditions")
local Space = { provider = " " }

local FileNameAndIconBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end
}

local FileIcon = {
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end
}

local FileName = {
  provider = function(self)
    -- first, trim the pattern relative to the current directory. For other
    -- options, see :h filename-modifers
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    -- now, if the filename would occupy more than 1/4th of the available
    -- space, we trim the file path to its initials
    -- See Flexible Components section below for dynamic truncation
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
