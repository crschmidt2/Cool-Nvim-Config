-- ys{motion}{char} = You Surround = Surround the motion with the character
-- ds{motion}{char} = Delete surround
-- cs{motion}{char} = Change surround
--
-- yss = Surround current line
-- S{char} = Surround in visual mode

return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  opts = {
    surrounds = {
      ["("] = {
        add = { "(", ")" },
      },
      ["{"] = {
        add = { "{", "}" },
      },
      ["["] = {
        add = { "[", "]" },
      }
    }

  },
  config = function(_, opts)
    require("nvim-surround").setup(opts)
  end
}
