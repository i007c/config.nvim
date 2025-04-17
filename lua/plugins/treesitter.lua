return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'rust', 'scss', 'c', 'lua', 'python',
                'javascript', 'typescript', 'comment'
            },
            sync_install = true,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = function(_, buf)
                    local max_filesize = 200 * 1024 -- 200 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },

            indent = {
                enable = true
            },

            ignore_install = {},
            modules = {}
        })

        vim.opt.indentexpr = 'syntax'
        -- vim.opt.indentexpr = 'nvim_treesitter#indent()'

        -- its lags on large files for some reason
        -- vim.opt.foldmethod = 'expr'
        -- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        vim.opt.foldenable = false
    end,
}
