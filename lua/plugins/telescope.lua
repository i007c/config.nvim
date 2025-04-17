return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    lazy = false,
    dependencies = {
        "AckslD/nvim-neoclip.lua",
        "stevearc/aerial.nvim",
    },
    config = function()
        require('neoclip').setup()
        require('aerial').setup({
            attach_mode = "global",
            keymaps = {
                ["<Tab>"] = "actions.scroll"
            }
        })

        local telescope = require('telescope')

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
        vim.keymap.set('n', '<leader>pl', function()
            builtin.live_grep({ cwd = vim.fn.input('Live Grep CWD > ') })
        end)

        vim.keymap.set('n', '<leader>pr', function()
            builtin.grep_string({
                search = vim.fn.input('Grep Regex > '),
                use_regex = true
            })
        end)

        vim.keymap.set({ 'n', 'i' }, '<C-G>', telescope.extensions.aerial.aerial)
    end,
}
