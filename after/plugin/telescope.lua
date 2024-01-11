local telescope = require('telescope')
local nvim_tree = require('nvim-tree')
local project_actions = require("telescope._extensions.project.actions")
local project_utils = require("telescope._extensions.project.utils")
local telescope_actions = require("telescope.actions")
local neoclip = require('neoclip')

neoclip.setup()

telescope.setup({
    extensions = {
        project = {
            base_dirs = {
                { '~/projects/', max_depth = 2 },
            },
            hidden_files = true, -- default: false
            theme = 'dropdown',
            order_by = 'asc',
            search_by = 'title',
            sync_with_nvim_tree = false, -- default false
            on_project_selected = function(prompt_bufnr)
                local path = project_actions.get_selected_path(prompt_bufnr)
                telescope_actions.close(prompt_bufnr)
                project_utils.change_project_dir(path)
                nvim_tree.change_dir(path)
                nvim_tree.focus()
            end
        }
    }
})


telescope.load_extension('project')
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

vim.keymap.set('n', '<leader>pp', telescope.extensions.project.project)
vim.keymap.set({ 'n', 'i' }, '<C-G>', telescope.extensions.aerial.aerial)
