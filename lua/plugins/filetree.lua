local my_on_attach = function(bufnr)
    local api = require "nvim-tree.api"

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.del("n", "<C-e>", { buffer = bufnr })

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', 'A', function()
        local node = api.tree.get_node_under_cursor()
        local path = node.type == "directory" and node.absolute_path or vim.fs.dirname(node.absolute_path)
        require("easy-dotnet").create_new_item(path)
    end, opts('Create file from dotnet template'))

    vim.keymap.set("n", "?",     api.tree.toggle_help,                  opts("Help"))
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        keys = {
            { "<C-e>", "<cmd>NvimTreeToggle<CR>", desc = "Open file tree" },
        },

        opts = {
            view = {
                side = 'right',
                number = true,
                relativenumber = true
            },
            update_focused_file = {
                enable = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true
                },
            },
            git = {
                enable = false
            },
            hijack_cursor = true,
            renderer = {
                add_trailing = true,
                icons = {
                    show = {
                        folder_arrow = false,
                    },
                },
                indent_markers = {
                    enable = true,
                },
            },
            on_attach = my_on_attach,
        },
        config = function(_, opts)
            require("nvim-tree").setup(opts)
        end
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}
