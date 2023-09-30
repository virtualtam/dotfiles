-- Go
return {
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        build = ':lua require("go.install").update_all_sync()',
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            require("go").setup({
                lsp_cfg = {
                    capabilities = capabilities,
                },
                lsp_inlay_hints = {
                    enable = false,
                },
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
