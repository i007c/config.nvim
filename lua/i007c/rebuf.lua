vim.api.nvim_create_user_command('Rebuf', (function(ctx)
    local lines = vim.split(
        vim.api.nvim_exec(ctx.args, true),
        '\n',
        { plain = true }
    )
    vim.cmd('new')
    vim.cmd('set filetype=text')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.opt_local.modified = false

    local bufnr = vim.api.nvim_win_get_buf(0)

    vim.keymap.set(
        'n', 'q',
        function() vim.api.nvim_buf_delete(bufnr, { force = true }) end,
        { buffer = bufnr, noremap = true, silent = true, nowait = true }
    )

end), { nargs = '+', complete = 'command' })
