local telescope = require('telescope')
local neoclip = require('neoclip')

neoclip.setup()

telescope.setup({
    defaults = {
        file_ignore_patterns = { "rapidoc.js" },
    },

    extensions = {}
})


telescope.load_extension('aerial')
telescope.load_extension('neoclip')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

vim.keymap.set('n', '<leader>pr', function()
    builtin.grep_string({
        search = vim.fn.input('Grep Regex > '),
        use_regex = true
    })
end)

vim.keymap.set({ 'n', 'i' }, '<C-G>', telescope.extensions.aerial.aerial)
