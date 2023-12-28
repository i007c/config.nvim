require('trouble').setup()

require('colorizer').setup({ '*' }, {
    -- mode = 'foreground',
    names = false,
    RRGGBBAA = true,
})

require('hex').setup()

require('LspUI').setup({
    prompt = false
})

require('fidget').setup({
    progress = {
        display = {
            done_ttl = 1
        }
    },
    notification = {
        window = {
            winblend = 0,
        }
    }
})

require('nvim-surround').setup()

vim.cmd([[
    let g:undotree_SplitWidth=27
    let g:undotree_WindowLayout=3
    let g:undotree_DiffAutoOpen=0
]])

vim.cmd([[
    let g:mkdp_auto_start = 1
    let g:mkdp_echo_preview_url = 1
]])



-- require('leap').add_default_mappings(true)
-- require('leap').init_highlight(true)
