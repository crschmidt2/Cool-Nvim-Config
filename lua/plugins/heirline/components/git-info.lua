local conditions = require("heirline.conditions")

local Space = {
  provider = " ",
  condition = function(self)
    return self.has_changes
  end
}

local GitSignDivider = {
  provider = "/",
  condition = function(self)
    return self.has_changes
  end
}

local GitChanges = {
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("+" .. count)
    end,
    hl = { fg = "git_add" },
  },
  {
    GitSignDivider,
    condition = function(self)
      local count = self.status_dict.changed or 0
      local addCount = self.status_dict.added or 0

      return count > 0 and addCount > 0
    end
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count)
    end,
    hl = { fg = "git_change" },
  },
  {
    GitSignDivider,
    condition = function(self)
      local count = self.status_dict.removed or 0
      local addCount = self.status_dict.added or 0
      local changeCount = self.status_dict.removed or 0

      return count > 0 and (addCount > 0 or changeCount > 0)
    end
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count)
    end,
    hl = { fg = "git_del" },
  },
}

local Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = "purple" },

  {
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = { bold = true },
  },
  Space,
  GitChanges,
}

return Git
