
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>g', '<CMD>belowright Git<CR>')
vim.keymap.set('n', '<leader>gl', '<CMD>Git pull<CR>')
vim.keymap.set('n', '<leader>gp', '<CMD>Git push<CR>')

vim.keymap.set('n', 'm', '<C-W><C-W>')

vim.keymap.set('n', '<C-9>', '<Plug>RestNvim')

vim.keymap.set({'n', 'i'}, '<C-S>', vim.cmd.w)

vim.keymap.set('n', '<S-B>', '<CMD>LspUI diagnostic next<CR>')


-- now this is epic - ThePrimeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])


