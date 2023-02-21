
local mason = require('mason')
local lspconfig = require('lspconfig')
local lsp = require('lsp-zero')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local mlspc = require('mason-lspconfig')


lsp.preset({ name = 'recommended', manage_nvim_cmp = false })

-- local lsp = require('lsp-zero').preset({
--     name = 'recommended',
--     manage_nvim_cmp = false,
-- })

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

