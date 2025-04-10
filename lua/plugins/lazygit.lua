return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { '<C-\\>', "<cmd>LazyGit<cr>", desc = "LazyGit", mode = { 'n', 'i', 'v' } },
    }
}
