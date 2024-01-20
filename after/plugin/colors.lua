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
            ['@parameter'] = { fg = '#ff7b56' },
            Exception = { fg = '#ff2457' },
            ['@exception'] = { fg = '#ff2457' },
            ['@include'] = { fg = '#ff2457' },
            ['@define'] = { fg = '#ff2457' },
            ['@keyword.return'] = { fg = '#ff2457' },
            ['@function.builtin'] = { fg = '#76fec5' },
            ['@type.builtin'] = { fg = '#ffcb7f' },
            ['@constant.builtin'] = { fg = '#00dc7d' },
            ['@constant'] = { fg = '#f2f4f8' },
            ['@property'] = { fg = '#f2f4f8' },
            ['@variable.builtin'] = { fg = '#f2f4f8' },
            ['@field'] = { fg = '#f2f4f8' },
            ['@string.escape'] = { fg = '#00dc7d' },
            ['@constructor'] = { fg = '#ffcb7f' },
            ['@keyword.operator'] = { fg = '#f375f3' },
            ['@keyword.function'] = { fg = '#f375f3' },
            ['@operator'] = { fg = '#f375f3' },

            NvimTreeRootFolder = { fg = '#999999' },
            NvimTreeFolderName = { fg = '#f2f4f8' },
            NvimTreeOpenedFolderName = { fg = '#f2f4f8' },
            NvimTreeFolderIcon = { fg = '#ff2970' },
            NvimTreeClosedFolderIcon = { fg = '#ff2970' },
            NvimTreeOpenedFolderIcon = { fg = '#ff2970' },
            NvimTreeGitDirtyIcon = { fg = '#ffcb7f' },
            NvimTreeGitDeletedIcon = { fg = '#ff2457' },

            fugitiveUnstagedHeading = { fg = '#f9ca24' },
            fugitiveStagedHeading = { fg = '#00dc7d' },
            fugitiveHeading = { fg = '#ff2457' },

            diffSubname = { fg = '#f2f4f8' },
        }
    },

    specs = {
        carbonfox = {
            syntax = {
                string = '#b0ffa2',
                bracket = '#f9ca24',
                number = '#00dc7d',
                keyword = '#ff2457',
                type = '#ffcb7f',
                builtin1 = '#e346e3', -- builtin type
                func = '#699fff',
                preproc = '#ff2457',
                conditional = '#ff2457',
                statement = '#ff2457',
            }
        }
    }
})


vim.cmd('colorscheme carbonfox')
