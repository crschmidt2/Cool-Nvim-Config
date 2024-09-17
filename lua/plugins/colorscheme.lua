--Find highlight group id using echo hlID("NonText") repalce nontext with hgihlight group name
--get highlight groups using :help hl-*autocomplete here*
--:echo synIDattr(synIDtrans(hlID('NonText')), 'bg')
--to get colors: :lua print(vim.inspect(vim.api.nvim_get_color_map()))
--
--vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', {fg = 'Gray31'})
return
{
  {
    "zaldih/themery.nvim",
    priority = 1000,
    opts = {
      themes = { "tokyonight", "onedark", "ayu", "gruvbox" },
      livePreview = true
    },
    config = function(_, opts)
      vim.keymap.set('n', '<leader>cs', '<cmd>Themery<CR>')
      require("themery").setup(opts)
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 999,
    opts = {
      style = "storm",
      on_colors = function(c)
        c.comment = "#7f88b3"
      end,

      on_highlights = function(h, c)
        h.LineNr = { fg = c.comment }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 999,
    opts = {
      style = "cool",
      colors = {
        borderColor = "#FFFFFF",
        nontext = "#242b38"
      },
      highlights = {
        ["FloatBorder"] = { fg = '$borderColor', bg = '$nontext' },
        ["TelescopePreviewBorder"] = { fg = '$borderColor', bg = '$nontext' },
        ["TelescopeResultsBorder"] = { fg = '$borderColor', bg = '$nontext' },
        ["TelescopePromptBorder"] = { fg = '$borderColor', bg = '$nontext' },
        ["NvimTreeIndentMarker"] = { fg = 'Gray31' },
      },
    },
    config = true,
  },
  {
    "Shatur/neovim-ayu",
    lazy = true,
    priority = 999,
    opts = {
      mirage = true,
    },
    config = function(_, opts)
      require("ayu").setup(opts)
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 999,
    config = function()
      require("gruvbox").setup()
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "Red" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "Red" })
    end
  }
}
