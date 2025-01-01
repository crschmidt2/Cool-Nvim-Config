local conditions = require("heirline.conditions")

local getOsLogo = function()
  local osName = vim.loop.os_uname().sysname
  if osName == 'Windows_NT'
  then
    return ''
  elseif osName == 'Linux'
  then
    return ''
  else
    return ''
  end
end

return {
  init = function(self)
    self.mode = vim.fn.mode(1)     -- :h mode()
  end,
  static = {
    mode_names = {     -- change the strings if you like it vvvvverbose!
      n = "N",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "V",
      vs = "Vs",
      V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
    mode_colors = {
      n = "blue",
      i = "purple",
      v = "green",
      V = "green",
      ["\22"] = "green",
      c = "orange",
      s = "purple",
      S = "purple",
      ["\19"] = "purple",
      R = "orange",
      r = "orange",
      ["!"] = "cyan",
      t = "cyan",
    }
  },
  provider = function(self)
    return getOsLogo() .. "%2(" .. self.mode_names[self.mode] .. "%)"
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1)     -- get only the first mode character

    local backgroundColor = ""
    if conditions.is_active() then
      backgroundColor = "status_line_bg"
    else
      backgroundColor = "status_line_inactive_bg"
    end

    return {
      fg = self.mode_colors[mode],
      bold = true,
      bg = backgroundColor
    }
  end,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}
