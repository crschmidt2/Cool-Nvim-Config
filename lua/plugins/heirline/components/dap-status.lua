local DAPActive = {
    condition = function()
        local is_dap_loaded = require("lazy.core.config").plugins["nvim-dap"]._.loaded

        if not is_dap_loaded then
            return false
        end

        local session = require("dap").session()
        return session ~= nil
    end,
    provider = function()
        return " " .. "DEBUGGING"
    end,
    hl = { fg = "red", bold = true }

}

return DAPActive
