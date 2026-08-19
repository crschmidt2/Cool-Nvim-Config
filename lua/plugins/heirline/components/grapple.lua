local grapple = require("grapple")

local Grapple = {
    condition = function()
        local tags = grapple.tags()
        return tags and #tags > 0
    end,
    provider = function()
        return grapple.statusline()
    end,
    hl = { fg = "orange", bold = false },
    update = {
        "User",
        "BufEnter",
        callback = function(_, args)
            if args.event == "BufEnter"
                or args.match == "GrappleUpdate"
                or args.match == "GrappleScopeChanged"
            then
                vim.schedule(function()
                    vim.cmd.redrawstatus()
                end)
            end
        end,
    },
}

return Grapple
