-- Appearance
return {
    {
        "rmehri01/onenord.nvim",
        branch = "main",
        lazy = false,
        priority = 1000,
        config = function()
            require('onenord').setup()
        end
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup {
                options = {
                    mode = "tabs",
                },
            }
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'onenord'
                }
            }
        end
    },
}
