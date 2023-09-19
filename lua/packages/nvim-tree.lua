return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "Nvim Tree Toggle" },
		{ "<leader>ef", "<cmd>NvimTreeFocus<cr>", desc = "Nvim Tree Focus" },
	},
	opts = {
	},
	config = function(_, opts) 
		require("nvim-tree").setup(opts)
	end
}
