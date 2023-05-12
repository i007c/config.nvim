
BufNr = nil

vim.api.nvim_create_user_command('RunTyche', (function ()

    if BufNr ~= nil then
        vim.api.nvim_buf_delete(
            BufNr, { force = true, unload = true }
        )

        vim.api.nvim_clear_autocmds({
            event = 'BufWritePost',
            group = 'Tyche'
        })
    end

    vim.cmd('vnew')
    vim.cmd('wincmd L')
    vim.cmd('vertical resize 30')
    vim.cmd('set winwidth=30')
    vim.cmd('set winfixwidth')
    vim.cmd('set buftype=nofile')
    vim.cmd('set nonumber')
    vim.cmd('set norelativenumber')
    vim.cmd('set filetype=lua')

    BufNr = vim.api.nvim_win_get_buf(0)

    vim.cmd('wincmd h')

    vim.api.nvim_create_autocmd('BufWritePost', {
        group = vim.api.nvim_create_augroup('Tyche', { clear = true }),
        pattern = '*/plutus/tyche/*.{c,py,h}',
        callback = function()
            vim.api.nvim_buf_set_lines(BufNr, 0, -1, false, {'output:', ''})

            vim.fn.jobstart({'./tyche/build.sh'}, {
                stdout_buffered = true,
                stderr_buffered = true,
                on_stdout = function(_, data)
                    vim.api.nvim_buf_set_lines(BufNr, -1, -1, false, data)
                end,
                on_stderr = function(_, data)
                    vim.api.nvim_buf_set_lines(BufNr, -1, -1, false, data)
                end
            })
        end,
    })
end), {})
