
local mason = require('mason')
local lspconfig = require('lspconfig')
local lsp = require('lsp-zero')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local mlspc = require('mason-lspconfig')

lsp.preset({
    name = 'recommended',
    manage_nvim_cmp = false,
    configure_diagnostics = false,
    set_lsp_keymaps = true,
})

lsp.nvim_workspace()
lsp.setup()


local function lsp_keymaps(bufnr)
    local map = function(m, lhs, rhs)
        local opts = {remap = false, silent = true, buffer = bufnr}
        vim.keymap.set(m, lhs, rhs, opts)
    end

    -- LSP actions
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    map('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Diagnostics
    map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

local function lsp_attach(client, bufnr)
    local buf_command = vim.api.nvim_buf_create_user_command

    lsp_keymaps(bufnr)

    buf_command(bufnr, 'LspFormat', function()
        vim.lsp.buf.format()
    end, {desc = 'Format buffer with language server'})
end

lspconfig.ccls.setup({
    on_attach = lsp_attach,
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
            on_attach = lsp_attach,
            capabilities = capabilities
        })
    end,
    lua_ls = function ()
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = lsp_attach,
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

sign({ name = 'DiagnosticSignError', text = '???' })
sign({ name = 'DiagnosticSignWarn',  text = '???' })
sign({ name = 'DiagnosticSignHint',  text = '???' })
sign({ name = 'DiagnosticSignInfo',  text = '???' })


