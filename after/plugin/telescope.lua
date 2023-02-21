
local telescope = require('telescope')

require('telescope').setup({
    extensions = {
        project = {
            base_dirs = {
                { '~/projects/', max_depth = 2 },
            },
            hidden_files = true, -- default: false
            theme = 'dropdown',
            order_by = 'asc',
            search_by = 'title',
            sync_with_nvim_tree = true, -- default false
        }
    }
})


telescope.load_extension('project')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)

vim.keymap.set('n', '<leader>pp', telescope.extensions.project.project)


