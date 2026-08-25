--Find highlight group id using echo hlID("NonText") repalce nontext with hgihlight group name
--get highlight groups using :help hl-*autocomplete here*
--:echo synIDattr(synIDtrans(hlID('NonText')), 'bg')
--to get colors: :lua print(vim.inspect(vim.api.nvim_get_color_map()))
--

-- use echo synIDattr(synIDtrans(hlID("NonText")), "fg#") to get Hex code of highlight group!

--Gets the hex color code for a highlight group (by name)
-- local getHgHexColor = function(highlightGroup, what)
--   local fn = vim.fn
--   local highlightColor = fn.synIDattr(fn.synIDtrans(fn.hlID(highlightGroup)), what .. '#')
--   print(highlightColor)
--   return highlightColor
-- end

-- NEW IMPORTANT STUFF
-- Use :Inspect! to get info about current cursor (including buffer number)
-- Use :lua vim.print(vim.inspect_pos(buffer#, row#, col#)) to get highlight info about place cursor can't reach

return
{
    {
        "zaldih/themery.nvim",
        priority = 1000,
        opts = {
            themes = {
                "tokyonight-day", "tokyonight-moon", "tokyonight-night", "tokyonight-storm",
                "onedark", "onenord",
                "ayu",
                "kanagawa", "kanagawa-lotus", "kanagawa-dragon", "kanagawa-wave", "nightfox", "dayfox", "dawnfox",
                "duskfox", "nordfox", "terafox", "carbonfox", "material-deep-ocean", "moonfly", "vscode" },
            livePreview = true,
            --For some reason  a deprecated setting message for this settings shows every time neovim starts ONLY ON WINDOWS.
            --Until that bug is fixed, this is a workaround.
            themeConfigFile = "c:\\v:null",
        },
        config = function(_, opts)
            vim.keymap.set('n', '<leader>cs', '<cmd>Themery<CR>')
            require("themery").setup(opts)
        end
    },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 999,
        opts = {
            style = "storm",
            on_colors = function(c)
                c.comment = "#7f88b3"
            end,

            on_highlights = function(h, c)
                h.LineNr = { fg = c.comment }
            end,
        },
        config = true
    },
    {
        "navarasu/onedark.nvim",
        lazy = true,
        priority = 999,
        opts = {
            style = "darker",
            colors = {
                nontext = 'clear',
                tabBackground = '#282c34',
                tabFocusedText = '#a0a8b7',
                tabUnfocusedText = '#535965'
            },
            highlights = {
                ["FloatBorder"] = { bg = '$nontext' },
                ["NormalFloat"] = { bg = '$nontext' },
                ["RenderMarkdownCode"] = { bg = '$nontext' },
                ["TabLineFill"] = { fg = '$tabFocusedText' },
                ["TabLine"] = { fg = '$tabUnfocusedText' },
            },
        },
        config = true,
    },
    {
        "rmehri01/onenord.nvim",
        lazy = true,
        priority = 999,
        opts = {
        },
        config = true,
    },
    {
        "Shatur/neovim-ayu",
        lazy = true,
        priority = 999,
        config = function()
            local mirage = true

            local colors = require('ayu.colors')
            colors.generate(mirage)

            local opts = {
                mirage = mirage,
                overrides = {
                    Comment = { fg = colors.special },
                    LineNr = { fg = colors.comment }
                }
            }

            require("ayu").setup(opts)
        end
    },
    {
        "rebelot/kanagawa.nvim",
        priority = 999,
        lazy = true,
        config = true,
        opts = {
            --EXAMPLE HIGHLIGHT CONFIG
            colors = {
                --     palette = {
                --       -- change all usages of these colors
                --       sumiInk0 = "#000000",
                --       fujiWhite = "#FFFFFF",
                --     },
                theme = {
                    --       -- change specific usages for a certain theme, or for all of them
                    --       wave = {
                    --         ui = {
                    --           float = {
                    --             bg = "none",
                    --           },
                    --         },
                    --       },
                    --       dragon = {
                    --         syn = {
                    --           parameter = "yellow",
                    --         },
                    --       },
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                }
            },
        }
    },
    {
        "Mofiqul/vscode.nvim",
        lazy = true,
        priority = 999,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        priority = 999,
    },
    {
        "marko-cerovac/material.nvim",
        lazy = true,
        priority = 999,
    },
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = true, priority = 999 },
}
