
local mason = require('mason')
local lspconfig = require('lspconfig')
local lsp = require('lsp-zero')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local mlspc = require('mason-lspconfig')


lsp.preset({
    name = 'recommended',
    manage_nvim_cmp = false,
    configure_diagnostics = false
})

lsp.nvim_workspace()
lsp.setup()


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
        lspconfig[server_name].setup({
            capabilities = capabilities
        })
    end,
    lua_ls = function ()
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('', true)
                    }
                }
            }
        })
    end
})

mlspc.setup()
mason.setup()


local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({ name = 'DiagnosticSignError', text = '✘' })
sign({ name = 'DiagnosticSignWarn',  text = '▲' })
sign({ name = 'DiagnosticSignHint',  text = '⚑' })
sign({ name = 'DiagnosticSignInfo',  text = '' })


