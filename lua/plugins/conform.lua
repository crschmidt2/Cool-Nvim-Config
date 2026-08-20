local utils = require("lib.utils");

return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "ConformInfo" },
        opts = function()
            local prettier_bin = utils.get_mason_bin_file_path("prettier")

            --Keeps tags horizontal longer. These are CLI flags, so they outrank any project .prettierrc
            local prettier_style_args = { "--print-width", "140", "--bracket-same-line" }

            return {
                formatters_by_ft = {
                    html = { "prettier" },
                    htmlangular = { "prettier_angular" },
                    css = { "prettier" },
                    scss = { "prettier" },
                },
                formatters = {
                    prettier = {
                        command = prettier_bin,
                        prepend_args = prettier_style_args,
                    },
                    prettier_angular = {
                        command = prettier_bin,
                        args = vim.list_extend(
                            vim.deepcopy(prettier_style_args),
                            { "--parser", "angular", "--stdin-filepath", "$FILENAME" }
                        ),
                        stdin = true,
                    },
                },
            }
        end,
        config = function(_, opts)
            require("conform").setup(opts)
        end
    },
}
