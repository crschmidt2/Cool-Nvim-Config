return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.3',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
		{ "<leader>fo", "<cmd>Telescope git_files<cr>", desc = "Telescope find git files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
		{ "<leader>cs", "<cmd>Telescope colorscheme<cr>", desc = "Telescope colorscheme" },
	}
}
