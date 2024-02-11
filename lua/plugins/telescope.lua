return {
				"nvim-telescope/telescope.nvim",
				dependencies = {"nvim-lua/plenary.nvim"},
				keys = {
								{'<C-h>', '<cmd>Telescope help_tags<CR>', desc = 'Telescope search help tags'},
								{'<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Telescope find files'},
								{'<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'Telescope find in files'},
								{'<leader>fr', '<cmd>Telescope oldfiles<CR>', desc = 'Telescope resume file'},
				},
}

