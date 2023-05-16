
require('trouble').setup()

require('colorizer').setup({ '*' }, {
    -- mode = 'foreground',
    names = false,
    RRGGBBAA = true,
})

require('hex').setup()

require('LspUI').setup()

require('tree-sitter-just').setup({})

