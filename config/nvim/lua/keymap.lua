-- leader key
vim.g.mapleader = ","

-- tab navigation
vim.keymap.set("n", "<C-H>", "<cmd>tabprevious<cr>")
vim.keymap.set("n", "<C-L>", "<cmd>tabnext<cr>")
vim.keymap.set("i", "<C-H>", "<Esc><cmd>tabprevious<cr>")
vim.keymap.set("i", "<C-L>", "<Esc><cmd>tabnext<cr>")
