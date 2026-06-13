-- Tree-sitter parser and grammars
return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup {}

            require('nvim-treesitter').install({
                -- Default grammars
                "c",
                "lua",
                "query",
                "vim",
                "vimdoc",

                -- Language grammars
                "bash",
                "cmake",
                "comment",
                "cpp",
                "css",
                "cue",
                "dockerfile",
                "elixir",
                "erlang",
                "fish",
                "git_config",
                "git_rebase",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "gosum",
                "gotmpl",
                "gowork",
                "hcl",
                "html",
                "javascript",
                "json",
                "json5",
                "latex",
                "make",
                "markdown",
                "markdown_inline",
                "meson",
                "ninja",
                "python",
                "rst",
                "ruby",
                "rust",
                "sql",
                "ssh_config",
                "tmux",
                "toml",
                "vrl",
                "xml",
                "yaml",
                "zig",
            }):wait(300000)

            -- Highlighting via built-in vim.treesitter
            vim.api.nvim_create_autocmd('FileType', {
                pattern = '*',
                callback = function() pcall(vim.treesitter.start) end,
            })

            -- Indentation (experimental)
            vim.api.nvim_create_autocmd('FileType', {
                pattern = '*',
                callback = function()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            local move = require("nvim-treesitter-textobjects.move")

            require("nvim-treesitter-textobjects").setup {
                move = { set_jumps = true },
            }

            -- goto next start
            vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]o", function() move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]s", function() move.goto_next_start("@local.scope", "locals") end)
            vim.keymap.set({ "n", "x", "o" }, "]z", function() move.goto_next_start("@fold", "folds") end)

            -- goto next end
            vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer", "textobjects") end)

            -- goto previous start
            vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end)

            -- goto previous end
            vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end)
        end,
    },
}
