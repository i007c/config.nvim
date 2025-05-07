return {
    "hrsh7th/nvim-cmp",
    version = "*",
    lazy = false,
    priority = 70,
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'petertriho/cmp-git',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'onsails/lspkind.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        vim.lsp.config('*', { capabilities = capabilities })

        -- local luasnip = require('luasnip')

        -- luasnip.config.set_config({
        --     region_check_events = 'InsertEnter',
        --     delete_check_events = 'InsertLeave'
        -- })

        -- require('luasnip.loaders.from_vscode').load({
        --     paths = '~/.config/Code/User/snippets'
        -- })
        --
        -- require('luasnip.loaders.from_lua').load({
        --     paths = '../../lua/i007c/snippets/'
        -- })


        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
        end

        local feedkey = function(key, mode)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
        end

        local buffer = { name = 'buffer', keyword_length = 4, max_item_count = 10 }


        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn['vsnip#anonymous'](args.body)
                    -- luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert
                }),
                ['<C-n>'] = cmp.mapping.select_next_item({
                    behavior = cmp.SelectBehavior.Insert
                }),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
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
                -- ghost_text = true
            },
            sources = {
                -- { name = 'luasnip' },
                { name = 'vsnip' },
                { name = 'nvim_lsp' },
                buffer
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    menu = ({
                        buffer = '[buf]',
                        nvim_lsp = '[lsp]',
                        luasnip = '[LuaSnip]',
                        nvim_lua = '[lua]',
                        latex_symbols = '[latex]',
                    })
                }),
            },
        })


        cmp.setup.filetype('gitcommit', {
            sources = {
                { name = 'cmp_git' },
                buffer
            }
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { buffer }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'path',    max_item_count = 10 },
                { name = 'cmdline', max_item_count = 10 }
            }
        })
    end,
}
