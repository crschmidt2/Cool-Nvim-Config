return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	opts = {
		ensure_installed = { "lua" },
		highlight = { enable = true, use_languagetree = true },
		indent = { enable = false },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>s",
				node_incremental = "<A-i>",
				node_decremental = "<A-d>",
			},
		},
	},
	config = function(_, opts)
		require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
		require 'nvim-treesitter.configs'.setup(opts)
	end
}
