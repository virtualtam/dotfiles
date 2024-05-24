-- Navigation
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.7",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')

            -- Built-in picker functions
            -- https://github.com/nvim-telescope/telescope.nvim#pickers
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end,
    },
}
