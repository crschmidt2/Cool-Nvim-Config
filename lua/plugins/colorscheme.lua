--Find highlight group id using echo hlID("NonText") repalce nontext with hgihlight group name
--get highlight groups using :help hl-*autocomplete here*
--:echo synIDattr(synIDtrans(hlID('NonText')), 'bg')
--to get colors: :lua print(vim.inspect(vim.api.nvim_get_color_map()))
--

-- use echo synIDattr(synIDtrans(hlID("NonText")), "fg#") to get Hex code of highlight group!

--Gets the hex color code for a highlight group (by name)
local getHgHexColor = function(highlightGroup, what)
  local fn = vim.fn
  local highlightColor = fn.synIDattr(fn.synIDtrans(fn.hlID(highlightGroup)), what .. '#')
  print(highlightColor)
  return highlightColor
end

-- NEW IMPORTANT STUFF
-- Use :Inspect! to get info about current cursor (including buffer number)
-- Use :lua vim.print(vim.inspect_pos(buffer#, row#, col#)) to get highlight info about place cursor can't reach

return
{
  {
    "zaldih/themery.nvim",
    priority = 1000,
    opts = {
      themes = {
        "tokyonight-day", "tokyonight-moon", "tokyonight-night", "tokyonight-storm",
        "onedark",
        "ayu",
        "gruvbox",
        "kanagawa", "kanagawa-lotus", "kanagawa-dragon", "kanagawa-wave" },
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
    config = true
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 999,
    opts = {
      style = "darker",
      colors = {
        nontext = 'clear',
      },
      highlights = {
        ["FloatBorder"] = { bg = '$nontext' },
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
    opts = {
      overrides = {
        SignColumn = { bg = 'None' },
      }
    },
    config = true
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 999,
    lazy = true,
    config = true,
    opts = {
      --EXAMPLE HIGHLIGHT CONFIG
      colors = {
        --     palette = {
        --       -- change all usages of these colors
        --       sumiInk0 = "#000000",
        --       fujiWhite = "#FFFFFF",
        --     },
        theme = {
          --       -- change specific usages for a certain theme, or for all of them
          --       wave = {
          --         ui = {
          --           float = {
          --             bg = "none",
          --           },
          --         },
          --       },
          --       dragon = {
          --         syn = {
          --           parameter = "yellow",
          --         },
          --       },
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },
    }
  }
}
