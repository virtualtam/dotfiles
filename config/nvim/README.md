# Neovim configuration
## Neovim documentation
- [Lua Guide](https://neovim.io/doc/user/lua-guide.html)
- [neovim/neovim#21342] - survey: options defaults

## Guides
- [Build your first Neovim configuration in lua](https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/)
- [Setup nvim-lspconfig + nvim-cmp](https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/)

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

#### Completion
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin
    - [Advanced techniques](https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques)
    - [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for path
    - [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) - nvim-cmp source for buffer words
    - [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - luasnip completion source for nvim-cmp

#### Snippets
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine

### Navigation
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
