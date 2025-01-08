local TerminalName = {
    provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return "  " .. tname
    end,
    hl = { fg = "red", bold = true },
}

return TerminalName
