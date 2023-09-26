return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		priority = 99,
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		priority = 98,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "cssls", "tsserver", "html" }
			})
			require("mason-lspconfig").setup_handlers {
				function(server_name) -- default handler (optional)
					local capabilities = require('cmp_nvim_lsp').default_capabilities()
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
				end,
			}
		end
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		priority = 97,
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<space>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})
		end
	},
}
