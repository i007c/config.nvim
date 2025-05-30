vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termbidi = true

vim.opt.colorcolumn = '80'

vim.g.mapleader = ' '

vim.filetype.add({
    extension = {
        h = "c",
    },
})
