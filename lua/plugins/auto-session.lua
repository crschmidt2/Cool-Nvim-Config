return {
    "rmagatti/auto-session",
    lazy = false,
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { "~/", "~/projects", "~/Downloads", "/" },
        auto_restore_last_session = false,
        -- log_level = 'debug',
    },
}
