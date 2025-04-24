local group = {
    Statement = { fg = '#fff000' },
    ['@parameter'] = { fg = '#ff7b56' },
    ['@variable.parameter'] = { fg = '#ff7b56' },
    Exception = { fg = '#ff2457' },
    ['@exception'] = { fg = '#ff2457' },
    ['@include'] = { fg = '#ff2457' },
    ['@define'] = { fg = '#ff2457' },
    ['@keyword.return'] = { fg = '#ff2457' },
    ['@function'] = { fg = '#699fff' },
    ['@function.builtin'] = { fg = '#76fec5' },
    ['@type'] = { fg = '#ffcb7f' },
    ['@type.builtin'] = { link = '@type' },
    ['@lsp.type'] = { link = '@type' },
    ['@attribute.scss'] = { fg = '#ffcb7f' },
    ['@constant.builtin'] = { fg = '#00dc7d' },
    ['@property'] = { fg = '#f2f4f8' },
    ['@variable.builtin'] = { fg = '#f2f4f8' },
    ['@field'] = { fg = '#f2f4f8' },
    ['@module'] = { fg = '#dfdfe0' },
    ['@string.escape'] = { fg = '#00dc7d' },
    ['@constructor'] = { fg = '#ffcb7f' },

    ['@keyword.operator'] = { fg = '#f375f3' },
    ['@keyword.function'] = { fg = '#f375f3' },
    ['@keyword.storage'] = { link = '@keyword' },

    ['@operator'] = { fg = '#f375f3' },
    ['@comment.todo'] = { link = '@text.todo' },
    ['@variable.member'] = { link = '@variable' },
    ['@lsp.type.enumMember'] = { link = '@variable' },
    ['@lsp.type.string'] = { link = '@string' },
    ['@lsp.type.member'] = { link = '@function' },
    ['@lsp.type.interface'] = { link = '@type' },
    ['@lsp.type.deriveHelper'] = { link = '@lsp.type.decorator' },
    ['@lsp.type.tomlTableKey.toml'] = { link = '@property.toml' },
    ['@lsp.type.tomlArrayKey.toml'] = { link = '@property.toml' },
    ['@lsp.type.decorator.rust'] = { link = '@function' },
    ['@lsp.type.deriveHelper.rust'] = { link = '@function' },
    ['@constant'] = { fg = '#f2f4f8' },
    ['@lsp.type.const.rust'] = { link = '@constant' },
    ['@lsp.type.procMacro.rust'] = { link = 'PreProc' },

    ['@tag.scss'] = { fg = '#ffcb7f' },
    ['@tag.tsx'] = { fg = '#ffcb7f' },
    ['@tag.builtin.tsx'] = { fg = '#ff2457' },
    ['@markup.heading.html'] = { fg = '#dfdfe0' },
    ['@tag.delimiter'] = { fg = '#e346e3' },

    NvimTreeRootFolder = { fg = '#999999' },
    NvimTreeExecFile = { fg = '#00dc7d' },
    NvimTreeFolderName = { fg = '#f2f4f8' },
    NvimTreeOpenedFolderName = { fg = '#f2f4f8' },
    NvimTreeFolderIcon = { fg = '#ff2970' },
    NvimTreeClosedFolderIcon = { fg = '#ff2970' },
    NvimTreeOpenedFolderIcon = { fg = '#ff2970' },

    NvimTreeGitDirtyIcon = { fg = '#ffcb7f' },
    NvimTreeGitDeletedIcon = { fg = '#ff2457' },
    NvimTreeGitNewIcon = { fg = '#00dc7d' },
    NvimTreeGitRenamedIcon = { link = 'NvimTreeGitNewIcon' },
    NvimTreeGitStagedIcon = { fg = '#ff7b56' },

    fugitiveUnstagedHeading = { fg = '#f9ca24' },
    fugitiveStagedHeading = { fg = '#00dc7d' },
    fugitiveHeading = { fg = '#ff2457' },

    diffSubname = { fg = '#f2f4f8' },
}

local colors = {
    options = {
        transparent = true,
        styles = {
            comments = 'italic'
        }
    },

    groups = { carbonfox = group },

    specs = {
        carbonfox = {
            syntax = {
                string = '#b0ffa2',
                bracket = '#f9ca24',
                number = '#00dc7d',
                keyword = '#ff2457',
                type = '#ffcb7f',
                -- builtin1 = '#e346e3', -- builtin type
                func = '#699fff',
                preproc = '#ff2457',
                conditional = '#ff2457',
                statement = '#ff2457',
            }
        }
    }
}

return {
    'EdenEast/nightfox.nvim',
    version = '*',
    lazy = false,
    dependencies = {
    },
    config = function()
        require('nightfox').setup(colors)

        vim.cmd('colorscheme carbonfox')
    end,
}
