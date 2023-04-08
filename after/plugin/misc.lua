
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

require('fidget').setup({
    window = {
        blend = 0
    }
})

local lsp_ui = require('LspUI')
lsp_ui.setup()

vim.keymap.set('n', '<S-B>', function() lsp_ui.api.diagnostic('next') end)

