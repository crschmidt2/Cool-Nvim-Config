local omnisharpPath = vim.fn.stdpath("data") ..
    --"/mason/packages/omnisharp/libexec/OmniSharp.dll"
    "/mason/bin/omnisharp"

if (vim.loop.os_uname().sysname == "Windows_NT") then
  omnisharpPath = omnisharpPath .. ".cmd"
  print(omnisharpPath)
end

local pid = vim.fn.getpid()

require 'lspconfig'.omnisharp.setup {

  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
  cmd = { tostring(omnisharpPath), '--languageserver', '--hostPID', tostring(pid) },

  enable_editorconfig_support = true,

  enable_ms_build_load_projects_on_demand = false,

  enable_roslyn_analyzers = false,

  organize_imports_on_format = true,

  enable_import_completion = true,

  sdk_include_prereleases = true,

  analyze_open_documents_only = false,
}
