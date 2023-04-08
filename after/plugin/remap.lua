
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

