
require('trouble').setup()

require('colorizer').setup({ '*' }, {
    -- mode = 'foreground',
    names = false,
    RRGGBBAA = true,
})

require('hex').setup()

require('LspUI').setup()

require('tree-sitter-just').setup({})

require('fidget').setup({
    timer = {
        fidget_decay = 100
    },
    window = {
        blend = 0,
    }
})


require('leap').add_default_mappings(true)
-- require('leap').init_highlight(true)
