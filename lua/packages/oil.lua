return {
	"stevearc/oil.nvim",
	keys = {
		{ "<leader>oi", "<cmd>Oil<cr>", desc = "Open oil" },

	},
	opts = {
		view_options = {
			show_hidden = true,
		}
	},
	config = function(_, opts) 
		require("oil").setup(opts)
	end
}
