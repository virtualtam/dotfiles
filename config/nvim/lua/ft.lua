vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = { "*/gitconfig", "*/.dots/git/*" },
    command = "setf gitconfig",
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*/.ssh/config.d/*",
    command = "setf sshconfig",
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = { "json", "yaml" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})
