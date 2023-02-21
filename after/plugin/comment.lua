
require('Comment').setup({
    mappings = {
        basic = false,
        extra = false
    }
})

local api = require('Comment.api')
local esc = vim.api.nvim_replace_termcodes(
    '<ESC>', true, false, true
)

vim.keymap.set('n', 'gcc', api.toggle.linewise.current)
vim.keymap.set('n', 'gcb', api.toggle.blockwise.current)

vim.keymap.set('x', 'gc', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    -- api.toggle.linewise(vim.fn.visualmode())
    api.locked('toggle.linewise')(vim.fn.visualmode())
end)

vim.keymap.set('x', 'gb', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    -- api.toggle.blockwise(vim.fn.visualmode())
    api.locked('toggle.blockwise')(vim.fn.visualmode())
end)


