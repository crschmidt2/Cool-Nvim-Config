return {
    {
        {
            'nvim-mini/mini.ai',
            version = false,
            opts = {
                -- No need to copy this inside `setup()`. Will be used automatically.
                {
                    -- Custom textobjects to be used on top of builtin ones.
                    -- For more information with examples see, `:h MiniAi.config`.
                    custom_textobjects = {},

                    -- Module mappings. Use `''` (empty string) to disable one.
                    mappings = {
                        -- Main textobject prefixes
                        around = 'a',
                        inside = 'i',

                        -- Next/last variants
                        -- NOTE: This (deliberately) overrides Neovim>=0.12 built-in incremental
                        -- selection mappings. See `:h MiniAi-default-an-in` for more details.
                        around_next = 'an',
                        inside_next = 'in',
                        around_last = 'al',
                        inside_last = 'il',

                        -- Move cursor to corresponding edge of `a` textobject
                        goto_left = '',
                        goto_right = '',
                    },

                    -- Number of lines within which textobject is searched
                    n_lines = 50,

                    -- How to search for object (first inside current line, then inside
                    -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
                    -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
                    search_method = 'cover_or_next',

                    -- Whether to disable showing non-error feedback
                    -- This also affects (purely informational) helper messages shown after
                    -- idle time if user input is required.
                    silent = false,
                }
            },
        },
    }
}
