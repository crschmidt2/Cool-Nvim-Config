return {
    "rmagatti/auto-session",
    lazy = false,
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        enabled = true,
        auto_restore_last_session = false,
    },
    config = function(_, opts)
        require('auto-session').setup(opts)
    end
}
