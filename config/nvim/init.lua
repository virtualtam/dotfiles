-- global configuration
require("keymap")
require("ft")
require("global")

-- lazy.nvim - install plugins
require("lazyinstall")
require("lazy").setup(
    "plugins",
    {
        change_detection = {
            notify = false,
        },
    }
)
