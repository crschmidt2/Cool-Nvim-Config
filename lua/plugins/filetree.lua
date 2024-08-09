local my_on_attach = function(bufnr)
  local api = require "nvim-tree.api"

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.del("n", "<C-e>", { buffer = bufnr })
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<C-e>", "<cmd>NvimTreeToggle<CR>", desc = "Open file tree" },
    },

    opts = {
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
