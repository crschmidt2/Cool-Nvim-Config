--Plugin for configuring roslyn language server for C#

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local on_attach = require('lspatt').

return {
  {
    "seblj/roslyn.nvim",
    ft = { "cs", "razor" },
    dependencies = {
      -- "neovim/nvim-lspconfig",
      -- RAZOR AND RAZOR PAGES LANGUAGE SERVER (not working)
      -- {
      --   "tris203/rzls.nvim",
      --   dependencies = { "seblj/roslyn.nvim" },
      --   opts = {},
      --   config = function(_, opts)
      --     require('rzls').setup(opts)
      --   end
      -- },
    },
    init = function()
      vim.filetype.add {
        extension = {
          razor = 'razor',
          cshtml = 'razor',
        },
      }
    end,
    opts = {
      config = {
        -- on_attach = require 'lspattach',
        -- capabilities = capabilities,
        -- handlers = require('rzls.roslyn_handlers'),
        settings = {
          ['csharp|inlay_hints'] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,

            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ['csharp|code_lens'] = {
            dotnet_enable_references_code_lens = true,
          },
        },
      },
      args = {
        '--logLevel=Information',
        '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
        '--razorSourceGenerator=' .. vim.fs.joinpath(
          vim.fn.stdpath 'data' --[[@as string]],
          'mason',
          'packages',
          'roslyn',
          'libexec',
          'Microsoft.CodeAnalysis.Razor.Compiler.dll'
        ),
        '--razorDesignTimePath=' .. vim.fs.joinpath(
          vim.fn.stdpath 'data' --[[@as string]],
          'mason',
          'packages',
          'rzls',
          'libexec',
          'Targets',
          'Microsoft.NET.Sdk.Razor.DesignTime.targets'
        ),
      }
    },
    config = function(_, opts)
      require('roslyn').setup(opts)
    end
  }
}
