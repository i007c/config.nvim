local function lsp_keymaps(bufnr)
    local map = function(m, lhs, rhs)
        local opts = { remap = false, silent = true, buffer = bufnr }
        vim.keymap.set(m, lhs, rhs, opts)
    end

    -- LSP actions
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover({ border = "rounded" })<cr>')
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help({ border = "rounded" })<cr>')
    map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    map('n', '<F3>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    map('x', '<F3>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Diagnostics
    map('n', 'gf', '<cmd>lua vim.diagnostic.open_float()<cr>')
    -- map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    map('n', 'B', '<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<cr>')
end


local function lsp_attach(_, bufnr)
    local max_filesize = 200 * 1024 -- 200 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
    if ok and stats and stats.size > max_filesize then
        print("ignore")
        return
    end


    local buf_command = vim.api.nvim_buf_create_user_command

    lsp_keymaps(bufnr)

    buf_command(bufnr, 'LspFormat', function()
        vim.lsp.buf.format()
        vim.cmd("Format")
    end, { desc = 'Format buffer with language server' })
end

return {
    "neovim/nvim-lspconfig",
    version = "*",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require('lspconfig')
        local mlspc = require('mason-lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        mlspc.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_attach,
                    capabilities = capabilities
                })
            end,
            lua_ls = function()
                lspconfig.lua_ls.setup({
                    capabilities = capabilities,
                    on_attach = lsp_attach,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' }
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file('', true),
                                checkThirdParty = false
                            },
                            telemetry = {
                                enable = false,
                            },
                        }
                    }
                })
            end,
        })

        mlspc.setup()
    end,
}
