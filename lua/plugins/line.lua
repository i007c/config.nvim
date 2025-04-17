return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
        local lualine = require('lualine')
        -- local progress = require('lsp-progress')

        lualine.setup({
            options = {
                section_separators = '',
                component_separators = '',
                globalstatus = true,
                refresh = {
                    statusline = 300
                }
            },
            sections = {
                lualine_c = {
                    'filename',
                    -- progress.progress
                }
            }
        })
    end
}
