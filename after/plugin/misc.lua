
require('trouble').setup()

require('colorizer').setup({ '*' }, {
    -- mode = 'foreground',
    names = false,
    RRGGBBAA = true,
})

require('hex').setup()

require('rest-nvim').setup({
    result_split_horizontal = true,
    result_split_in_place = true,
    env_file = '.env.rest',
})

require('LspUI').setup()

