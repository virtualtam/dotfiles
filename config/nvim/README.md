# Neovim configuration
## Documentation
- [Lua Guide](https://neovim.io/doc/user/lua-guide.html)
- [neovim/neovim#21342] - survey: options defaults

## Lua
- [The Lua programming language](https://www.lua.org/)
- [luarocks/lua-style-guide](https://github.com/luarocks/lua-style-guide)

## Guides
- [Build your first Neovim configuration in lua](https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/)
- [Setup nvim-lspconfig + nvim-cmp](https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/)
- [Configuring NeoVim as a Python IDE](https://www.playfulpython.com/configuring-neovim-as-a-python-ide/)
- [Rust and Neovim - A Thorough Guide and Walkthrough](https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/)
- [Neovim and Rust](https://sharksforarms.dev/posts/neovim-rust/)

## Plugins
### Plugin management
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - A modern plugin manager for Neovim

### Appearance
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Snazzy bufferline
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Neovim statusline
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Icons from patched
  [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)

### Edition
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Automatic insertion of character pairs `[("")]`
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart comment plugin

### Language support, syntax highlight and completion
#### Tree-sitter grammars
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Tree-sitter parsing library support for language parser grammars
    - [Tree-sitter](https://tree-sitter.github.io/tree-sitter/)
    - [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - Syntax aware text-objects, select, move, swap, and peek support

#### Language Server Protocol
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configs for Nvim LSP
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Install and manage LSP servers, DAP servers, linters, and formatters
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Use lspconfig with mason.nvim
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Inject LSP diagnostics, code actions, and more via Lua

#### Debug Adapter Protocol
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol client implementation
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - A UI for nvim-dap
- [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) - Virtual text support for nvim-dap

#### Completion
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin
    - [Advanced techniques](https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques)
    - [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for path
    - [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) - nvim-cmp source for buffer words
    - [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - luasnip completion source for nvim-cmp

#### Snippets
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine

### Language integrations
- [ray-x/go.nvim](https://github.com/ray-x/go.nvim) - Go development plugin, leveraging gopls, treesitter AST, Dap, and various Go tools
- [folke/neodev.nvim](https://github.com/folke/neodev.nvim) - Neovim setup for init.lua and plugin development
- [simrat39/rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim) - Rust development tools

### Navigation
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
