return {
	"windwp/nvim-ts-autotag",
	opts = {
		filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx',
			'jsx', 'rescript',
			'xml',
			'php',
			'markdown',
			'astro', 'glimmer', 'handlebars', 'hbs', 'htmx' },
	},
	config = function(_)
		require('nvim-ts-autotag').setup()
	end

}
