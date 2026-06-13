-- Go
return {
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
            "mfussenegger/nvim-dap",
            { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
            "theHamsta/nvim-dap-virtual-text",
        },
        build = ':lua require("go.install").update_all_sync()',
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        config = function()
            require("go").setup({
                lsp_cfg = false,
                lsp_inlay_hints = {
                    enable = false,
                },
                dap_debug_gui = true,
                dap_debug_vt = true,
                dap_debug_keymap = true,
            })

            -- Format on save
            local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require('go.format').goimport()
                end,
                group = format_sync_grp,
            })
        end,
    },
}
