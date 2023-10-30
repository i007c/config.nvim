require('nvim-treesitter.configs').setup({
	ensure_installed = {
        'c', 'lua', 'python', 'javascript', 'typescript', 'comment'
    },
	sync_install = true,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

    indent = {
        enable = true
    },

    autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = false,
    }
})

vim.opt.indentexpr = 'syntax'
-- vim.opt.indentexpr = 'nvim_treesitter#indent()'

-- its lags on large files for some reason
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

