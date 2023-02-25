
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    view = {
        width = 25,
        mappings = {
            list = {
                { key = "m", action = "" },
            },
        },
    },
    filters = {
        custom = {
            'node_modules',
            '__pycache__',
            '.pytest_cache',
            '^\\.env$',
            '^\\.git$',
            'package-lock.json',
            '^\\.ccls-cache$'
        }
    },
    renderer = {
        icons = {
            git_placement = 'after',
            glyphs = {
                git = {
                    unstaged = '',
                    staged = '',
                    untracked = '',
                    deleted = '',
                    ignored = '',
                }
            }
        }
    },
    git = {
        ignore = false
    }
})

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


