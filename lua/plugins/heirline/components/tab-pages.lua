local utils = require("heirline.utils")

local GetTabpageIndex = function(tabpage)
  local tabpages = vim.api.nvim_list_tabpages()
  for i, v in ipairs(tabpages) do
    if v == tabpage then
      return i
    end
  end
end

local Tabpage = {
  provider = function(self)
    return self.tabnr
  end,
  hl = function(self)
    if not self.is_active then
      return "TabLine"
    else
      return "TabLineSel"
    end
  end,
}

local TabPages = {
  -- only show this component if there's 2 or more tabpages
  condition = function()
    return #vim.api.nvim_list_tabpages() >= 2
  end,
  -- { provider = "%=" },
  utils.make_tablist(Tabpage),
}

return TabPages
