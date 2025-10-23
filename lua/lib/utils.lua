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

return M
