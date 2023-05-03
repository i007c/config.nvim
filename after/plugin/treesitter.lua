require('nvim-treesitter.configs').setup({
	ensure_installed = { 'c', 'lua', 'python', 'help', 'javascript', 'typescript' },
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
        enable = true
    }
})

vim.opt.indentexpr = 'syntax'
-- vim.opt.indentexpr = 'nvim_treesitter#indent()'

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

