return
				{
								{
												"folke/tokyonight.nvim",
												lazy = true,
												opts = {
																style="storm",
																on_colors = function(c)
																				c.comment = "#7f88b3"
																end,

																on_highlights = function(h, c)
																				h.LineNr = { fg = c.comment}
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
																style="cool",
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


