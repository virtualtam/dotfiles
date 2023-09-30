-- Edition
return {
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/nvim-cmp"
        },
        config = function()
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
            )
            require("nvim-autopairs").setup {}
        end
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },
}
