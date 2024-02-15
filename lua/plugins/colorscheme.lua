--Find highlight group id using echo hlID("NonText") repalce nontext with hgihlight group name
--get highlight groups using :help hl-*autocomplete here*
--:echo synIDattr(synIDtrans(hlID('NonText')), 'bg')
--to get colors: :lua print(vim.inspect(vim.api.nvim_get_color_map()))
--
--vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', {fg = 'Gray31'})
return
{
	{
		"folke/tokyonight.nvim",
		lazy = true,
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
		opts = {
			style = "cool",
			colors = {
				borderColor = "#ffffff",
				nontext = "#242b38"
			},

			highlights = {
				["FloatBorder"] = { fg = '$borderColor', bg = '$nontext' },
				["NormalFloat"] = { bg = '$nontext' },
				["TelescopePreviewBorder"] = { fg = '$borderColor', bg = '$nontext' },
				["TelescopeResultsBorder"] = { fg = '$borderColor', bg = '$nontext' },
				["TelescopePromptBorder"] = { fg = '$borderColor', bg = '$nontext' },
				["NvimTreeIndentMarker"] = { fg = 'Gray31' },
			},
		},

	},
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		opts = {
			mirage = true,
		},
		config = function(_, opts)
			require("ayu").setup(opts)
		end
	}
}
