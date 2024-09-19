return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  opts = {
    ensure_installed = { "lua", "markdown", "json", "vimdoc", "javascript", "typescript", "rust", "c_sharp", "vue"  },
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
    vim.filetype.add({
      pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    })

    -- CLASSIC ASP HIGHLIGHTING
    vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
      callback = function()
        if vim.opt.filetype:get() == 'aspvbs' then
          vim.api.nvim_command('set ft=vb')
        end
      end
    })
  end
}
