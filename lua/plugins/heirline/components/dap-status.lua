local DAPActive = {
    condition = function()
        local session = require("dap").session()
        return session ~= nil
    end,
    provider = function()
        return " " .. "DEBUGGING"
    end,
    hl = { fg = "red", bold = true }

}

return DAPActive
