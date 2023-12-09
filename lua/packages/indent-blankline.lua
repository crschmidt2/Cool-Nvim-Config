return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {exclude = {
		filetypes = {
			'dashboard',
			'lspinfo',
			'packer',
			'lazy',
			'checkhealth',
			'help',
			'man',
			'gitcommit',
			'TelescopePrompt',
			'TelescopeResults',
			'',
		}
	}},
}
