-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>g', '<CMD>belowright Git<CR>')
vim.keymap.set('n', '<leader>gl', '<CMD>Git pull<CR>')
vim.keymap.set('n', '<leader>gp', '<CMD>Git push<CR>')

vim.keymap.set('n', 'm', '<C-W><C-W>')
vim.keymap.set('n', 'M', '<CMD>NvimTreeFocus<CR>')

vim.keymap.set({ 'n', 'i' }, '<C-S>', vim.cmd.w)

-- local trouble = require("trouble")
-- vim.keymap.set('n', '<S-B>', (function()
--     trouble.open('diagnostics')
--     trouble.next({ skip_groups = true, jump = true });
-- end))


vim.keymap.set({ 'n', 'i' }, '<up>', '<nop>')
vim.keymap.set({ 'n', 'i' }, '<down>', '<nop>')
vim.keymap.set({ 'n', 'i' }, '<left>', '<nop>')
vim.keymap.set({ 'n', 'i' }, '<right>', '<nop>')


-- now this is epic - ThePrimeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set("x", "<leader>p", [["_dP]])

-- github
-- vim.keymap.set('n', '<leader>il', '<CMD>Octo issue list<CR>')
-- vim.keymap.set('n', '<leader>ic', '<CMD>Octo issue create<CR>')
-- vim.keymap.set('n', '<leader>pl', '<CMD>Octo pr list<CR>')
-- vim.keymap.set('n', '<leader>pc', '<CMD>Octo pr create<CR>')

-- colors
vim.keymap.set('n', '<leader>gi', '<CMD>Inspect<CR>')


vim.keymap.set({ 'n', 'i' }, '<C-n>', '<CMD>Telescope neoclip<CR>')

vim.keymap.set({ 'n', 'i' }, '<C-l>', '<CMD>UndotreeToggle<CR>')

vim.keymap.set('n', '<leader>gf', function()
    vim.lsp.buf.format()
    vim.cmd("Format")
end)

vim.keymap.set('n', '<leader>r', function()
    vim.cmd('silent !python ' .. vim.fn.expand('%'))
    if vim.v.shell_error ~= 0 then
        vim.cmd.echo('"ERROR"')
    end
end)

vim.cmd([[
    let g:ftplugin_sql_omni_key = '<C-j>'
    let g:vsnip_snippet_dir = '~/.config/nvim/vsnip/'
]])
