-- Language Server Protocol & Code Completion
return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            -- Global configuration
            local lspconfig = require('lspconfig')
            local lsp_defaults = lspconfig.util.default_config

            lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
            )

            -- Language servers
            lspconfig.gopls.setup({})
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
            lspconfig.rust_analyzer.setup({})

            -- Autocompletion
            vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

            local cmp = require('cmp')
            local luasnip = require('luasnip')
            local select_opts = {behavior = cmp.SelectBehavior.Select}

            cmp.setup({
                enabled = function()
                    -- disable completion in comments
                    local context = require 'cmp.config.context'
                    -- keep command mode completion enabled when cursor is in a comment
                    if vim.api.nvim_get_mode().mode == 'c' then
                        return true
                    else
                        return not context.in_treesitter_capture("comment")
                        and not context.in_syntax_group("Comment")
                    end
                end,
                formatting = {
                    fields = {'menu', 'abbr', 'kind'},
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            luasnip = '⋗',
                            -- buffer = 'Ω',
                            path = '🖫',
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                mapping = {
                    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
                    ["<Down>"] = cmp.mapping.select_next_item(select_opts),

                    ["<CR>"] = cmp.mapping.confirm({select = false}),
                    ["<Right>"] = cmp.mapping.confirm({select = false}),
                },
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp', keyword_length = 1},
                    -- {name = 'buffer', keyword_length = 3},
                    {name = 'luasnip', keyword_length = 2},
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
            })

            -- Integrations
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')

            cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
            )
        end
    },
}
