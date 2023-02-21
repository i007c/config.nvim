
require('mason').setup()
local mlspc = require('mason-lspconfig')
mlspc.setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.ccls.setup({
    init_options = {
        cache = {
            directory = '.ccls-cache';
        }
    },
    capabilities = capabilities
})

mlspc.setup_handlers({
    function (server_name)
        require('lspconfig')[server_name].setup({
            capabilities = capabilities
        })
    end,
})


local cmp = require('cmp')
local buffer = { name = 'buffer', keyword_length = 4, max_item_count = 10 }


cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },

    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn['vsnip#available'](1) == 1 then
                feedkey('<Plug>(vsnip-expand-or-jump)', '')
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                feedkey('<Plug>(vsnip-jump-prev)', '')
            end
        end, { 'i', 's' }),
    },
    experimental = {
        ghost_text = true
    },
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        },
        { buffer }
    )
})


cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        {
            { name = 'cmp_git' },
        },
        { buffer }
    )
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { buffer }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = 'path', max_item_count = 10 }
        },
        {
            { name = 'cmdline', max_item_count = 10 }
        }
    )
})


