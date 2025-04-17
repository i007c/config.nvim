return {

    {
        "iamcco/markdown-preview.nvim",
        -- lazy = true,
        -- ft = {"markdown"},
        -- build = function() vim.fn["mkdp#util#install"]() end
    },

    {
        "windwp/nvim-ts-autotag",
        version = "*",
        lazy = false,
        dependencies = {},
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false
                },
            })
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        version = "*",
        lazy = false,
        dependencies = {},
        config = function()
            require('colorizer').setup({ '*' }, {
                -- mode = 'foreground',
                names = false,
                RRGGBBAA = true,
            })
        end,
    },


    {
        "j-hui/fidget.nvim",
        tag = "v1.6.1",
        lazy = false,
        dependencies = {},
        config = function()
            require('fidget').setup({
                progress = {
                    display = {
                        done_ttl = 1
                    }
                },
                notification = {
                    window = {
                        winblend = 0,
                    }
                }
            })
        end,
    },

    {
        "kylechui/nvim-surround",
        lazy = false,
        dependencies = {},
        config = function()
            require('nvim-surround').setup()

            vim.cmd([[
                let g:undotree_SplitWidth=27
                let g:undotree_WindowLayout=3
                let g:undotree_DiffAutoOpen=0
            ]])

            vim.cmd([[
                let g:mkdp_auto_start = 1
                let g:mkdp_echo_preview_url = 1
            ]])
        end,
    },

    "mbbill/undotree",
}
