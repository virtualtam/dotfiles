-- Language Server Protocol & Code Completion
return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "saghen/blink.cmp",
        version = "*",
        lazy = false,
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("blink.cmp").setup({
                keymap = {
                    preset = "default",
                    ["<Up>"] = { "select_prev", "fallback" },
                    ["<Down>"] = { "select_next", "fallback" },
                    ["<CR>"] = { "accept", "fallback" },
                    ["<Right>"] = { "accept", "fallback" },
                },
                appearance = {
                    nerd_font_variant = "mono",
                },
                sources = {
                    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                    providers = {
                        lazydev = {
                            name = "LazyDev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                    },
                },
                completion = {
                    accept = {
                        auto_brackets = {
                            enabled = false,
                        },
                    },
                },
            })

            -- Global LSP keymaps — applies to all clients including rustaceanvim
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local map = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
                    end

                    map('gd', vim.lsp.buf.definition, 'Go to definition')
                    map('gD', vim.lsp.buf.declaration, 'Go to declaration')
                    map('gi', vim.lsp.buf.implementation, 'Go to implementation')
                    map('gr', vim.lsp.buf.references, 'Go to references')
                    map('K', vim.lsp.buf.hover, 'Hover documentation')
                    map('<leader>rn', vim.lsp.buf.rename, 'Rename')
                    map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
                    map('[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
                    map(']d', vim.diagnostic.goto_next, 'Next diagnostic')

                    -- Format on save for ruff (Python)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.name == "ruff" then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ async = false, name = "ruff" })
                            end,
                        })
                    end
                end,
            })

            -- Apply blink capabilities to all LSP servers (wildcard applies at server start time)
            vim.lsp.config('*', {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            -- Language-specific overrides
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        callSnippet = "Replace",
                    }
                }
            })

            -- Enable directly managed language servers
            vim.lsp.enable({ 'gopls', 'lua_ls' })

            -- Mason-managed language servers (automatic_enable = true by default)
            require('mason').setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "ruff" },
            })
        end
    },
}
