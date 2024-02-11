return {
				"nvim-telescope/telescope.nvim",
				dependencies = {"nvim-lua/plenary.nvim"},
				keys = {
								{'<leader>he', '<cmd>Telescope help_tags<CR>', desc = 'Telescope search help tags'},
								{'<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Telescope find files'},
								{'<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'Telescope find in files'},
								{'<leader>fr', '<cmd>Telescope oldfiles<CR>', desc = 'Telescope resume file'},
								{'<leader>bf', '<cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<CR>', desc = 'Telescope find in current buffer'},
								{'<leader>bs', '<cmd>Telescope treesitter theme=get_ivy<CR>', desc = 'Telescope treesitter symbols'},
				},
				opts = {
								defaults = {
												-- Default configuration for telescope goes here:
												-- config_key = value,
												mappings = {
																i = {
																				-- map actions.which_key to <C-h> (default: <C-/>)
																				-- actions.which_key shows the mappings for your picker,
																				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
																				--["<C-h>"] = "which_key"
																}
												}
								},
								pickers = {
												-- Default configuration for builtin pickers goes here:
												-- picker_name = {
												--   picker_config_key = value,
												--   ...
												-- }
												-- Now the picker_config_key will be applied every time you call this
												-- builtin picker
								},
								extensions = {
												-- Your extension configuration goes here:
												-- extension_name = {
												--   extension_config_key = value,
												-- }
												-- please take a look at the readme of the extension you want to configure
								}

				}
}

