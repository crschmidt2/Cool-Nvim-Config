local M = {}

---Returns full file path for a Mason binary (LSP, DAP, etc.)
---@param languageServerName string
---@return string masonFilePath
M.get_mason_bin_file_path = function(languageServerName)
    local osName = vim.loop.os_uname().sysname

    --Kind of a hacky way to get certain lsp/dap programs to work with Mason paths
    --(Csharp DAP specifically had problems with linux path when on Windows)
    if osName == 'Windows_NT' then
        local masonBinPath = vim.fn.stdpath('data') ..
            '\\mason\\bin\\' .. languageServerName .. '.cmd'

        return masonBinPath
    end

    local masonBinPath = vim.fn.stdpath('data') ..
        '/mason/bin/' .. languageServerName

    return masonBinPath
end

---Returns a boolean for whether Neovim is running on a windows machine
---@return boolean isOnWindows
M.is_on_windows = function()
    local osName = vim.loop.os_uname().sysname

    if osName == "Windows_NT" then return true end
    return false
end

M.place_at_end_of_line = function(input_string)
    local original_cursor_pos = vim.api.nvim_win_get_cursor(0)


    vim.api.nvim_command("norm! A");
    local end_of_line_cursor_pos = vim.api.nvim_win_get_cursor(0)
    local row, col = end_of_line_cursor_pos[1], end_of_line_cursor_pos[2]

    if vim.api.nvim_get_current_line() == "" then
        col = col - 1
    end

    vim.api.nvim_buf_set_text(0, row - 1, col + 1, row - 1, col + 1, { input_string })

    vim.api.nvim_win_set_cursor(0, original_cursor_pos);
end

return M

