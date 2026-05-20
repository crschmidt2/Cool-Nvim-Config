return {
    'fei6409/log-highlight.nvim',
    opts = {
        ---@type string|string[]: File extensions. Default: 'log'
        extension = { 'log' },

        ---@type string|string[]: File names or full file paths. Default: {}
        filename = {
            'syslog',
        },

        ---@type string|string[]: File name/path glob patterns. Default: {}
        pattern = {
            -- Use `%` to escape special characters and match them literally.
            '%/var%/log%/.*',
            'console%-ramoops.*',
            'log.*%.txt',
            'logcat.*',
        },

        ---@type table<string, string|string[]>: Custom keywords to highlight.
        ---This allows you to define custom keywords to be highlighted based on
        ---the group.
        ---
        ---The following highlight groups are supported:
        ---    'error', 'warning', 'info', 'debug' and 'pass'.
        ---
        ---The value for each group can be a string or a list of strings.
        ---All groups are empty by default. Keywords are case-sensitive.
        keyword = {
            error = 'ERROR_MSG',
            warning = { 'WARN_X', 'WARN_Y' },
            info = { 'INFORMATION' },
            debug = {},
            pass = {},
        },
    },
}
