
-- local palette = require('nightfox.palette').load('carbonfox')
-- local spec = require('nightfox.spec').load('carbonfox')

-- print(vim.inspect(spec.git))


require('nightfox').setup({
    options = {
        transparent = true,
        styles = {
            comments = 'italic'
        }
    },

    groups = {
        carbonfox = {
            Statement = { fg = '#fff000' },
            ['@parameter'] = { fg = '#FF7B56' },
            Exception = { fg = '#ff2457' },
            ['@exception'] = { fg = '#ff2457' },
            ['@keyword.return'] = { fg = '#ff2457' },
            ['@function.builtin'] = { fg = '#76FEC5' },
            ['@type.builtin'] = { fg = '#FFCB7f' },
            ['@constant.builtin'] = { fg = '#f2f4f8' },
            ['@constant'] = { fg = '#f2f4f8' },
            ['@property'] = { fg = '#f2f4f8' },
            ['@field'] = { fg = '#f2f4f8' },
            ['@string.escape'] = { fg = '#00DC7D' },
            ['@constructor'] = { fg = '#FFCB7F' },
            ['@keyword.operator'] = { fg = '#F375F3' },
            ['@keyword.function'] = { fg = '#F375F3' },
            ['@operator'] = { fg = '#F375F3' },

            NvimTreeRootFolder = { fg = '#999999' },
            NvimTreeFolderName = { fg = '#f2f4f8' },
            NvimTreeOpenedFolderName = { fg = '#f2f4f8' },
            NvimTreeFolderIcon = { fg = '#FF2970' },
        }
    },

    specs = {
        carbonfox = {
            syntax = {
                string = '#b0ffa2',
                bracket = '#f9ca24',
                number = '#00DC7d',
                keyword = '#ff2457',
                type = '#FFCB7F',
                builtin1 = '#e346e3',
                func = '#699fff',
                preproc = '#FF2457',
                conditional = '#FF2457',
                statement = '#FF2457',
            }
        }
    }
})


vim.cmd('colorscheme carbonfox')

