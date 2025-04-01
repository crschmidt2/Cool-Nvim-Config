local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local TabNumber = {
    provider = function(self)
        return "%" .. self.tabnr .. "T " .. self.tabnr .. " %T"
    end,
    hl = function(self)
        if not self.is_active then
            return { fg = "tabline_inactive_fg", bg = "tabline_active_bg" }
        else
            return "TabLineFill"
        end
    end,
}

local TabIcon = {
    provider = function(self)
        return self.icon and (self.icon .. " ")
    end,
    hl = function(self)
        if not self.is_active then
            return { fg = "tabline_inactive_fg", bg = "tabline_active_bg" }
        else
            return { fg = self.icon_color, bg = "tabline_active_bg" }
        end
    end
}

local TabName = {
    -- update = "FileReadPost",
    provider = function(self)
        -- local filename = vim.fn.fnamemodify(self.filename, ":t")
        local filename = vim.fn.fnamemodify(self.filename, ":.:t")
        if filename == "" then return "[No Name]" end

        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,
    hl = function(self)
        if not self.is_active then
            return { fg = "tabline_inactive_fg", bg = "tabline_active_bg" }
        else
            return "TabLineFill"
        end
    end,
}

local Tabpage = {
    init = function(self)
        local win = vim.api.nvim_tabpage_get_win(self.tabpage)
        local buf = vim.api.nvim_win_get_buf(win)
        self.filename = vim.api.nvim_buf_get_name(buf)
        local extension = vim.fn.fnamemodify(self.filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(self.filename, extension,
            { default = true })
        if not self.is_active then self.icon_color = "gray" end
    end,
    TabNumber,
    TabIcon,
    TabName
}

local TabPages = {
    -- only show this component if there's 2 or more tabpages
    condition = function()
        return #vim.api.nvim_list_tabpages() >= 2
    end,
    utils.make_tablist(Tabpage),
}

return TabPages
