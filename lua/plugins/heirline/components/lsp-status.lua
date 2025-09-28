local conditions = require("heirline.conditions")

local LSPActive = {
  -- condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach' },
  provider = function()
    local names = {}
    for i, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return " [" .. table.concat(names, " ") .. "]"
  end,
  hl = function()
    local highlight = ""

    if conditions.lsp_attached() then
      highlight = "orange"
    else
      highlight = "grey"
    end

    return { fg = highlight, bold = true }
  end

}

return LSPActive
