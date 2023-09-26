return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"rust",
			"typescript",
			"vue",
			"cpp",
			"javascript",
			"lua",
			"json",
			"vim",
			"vimdoc",
			"c_sharp",
			"html",
			"css",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end

}
