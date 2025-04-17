return {
    "tpope/vim-fugitive",
    version = "*",
    lazy = false,
    dependencies = {
        'lewis6991/gitsigns.nvim',
    },
    config = function()
        require('gitsigns').setup({
            signs               = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '-' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn          = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl               = true, -- Toggle with `:Gitsigns toggle_numhl`
            attach_to_untracked = true,
            sign_priority       = 6,
            update_debounce     = 100,
            max_file_length     = 3000, -- Disable if file is longer than this (in lines)
            preview_config      = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
        })
    end,
}
