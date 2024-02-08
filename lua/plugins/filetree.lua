return {
				{
"nvim-tree/nvim-tree.lua",
keys = {
				{"<C-e>", "<cmd>NvimTreeToggle<CR>"},
},
opts = {
hijack_cursor = true,
view = {
				cursorline = true
},
},
config = function(_, opts)
				require("nvim-tree").setup(opts)
end
},
{
				"nvim-tree/nvim-web-devicons",
				lazy = true,
},
}
