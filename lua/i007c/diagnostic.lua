vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '⚑',
        }
    },
    float = {
        border = 'rounded'
    }
})
