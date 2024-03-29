local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.isort.with({
            extra_args = { '-m', '9' }
        })
    },

    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(cf)
                            return cf.name == 'null-ls'
                        end
                    })
                end,
            })
        end
    end,

})
