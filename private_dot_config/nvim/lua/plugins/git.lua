-- Git SCM
return {
    {
        "lewis6991/gitsigns.nvim",
    },
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit UI" }
        }
    },
}
