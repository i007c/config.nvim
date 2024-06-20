vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'

    -- utils
    use 'nvim-lua/plenary.nvim'

    -- Color Theme
    use 'EdenEast/nightfox.nvim'

    -- moving between files
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
    }
    use 'nvim-telescope/telescope-project.nvim'
    use 'AckslD/nvim-neoclip.lua'

    use 'nvim-tree/nvim-tree.lua'
    use 'ThePrimeagen/harpoon'


    -- git
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'pwntester/octo.nvim'

    -- syntax stuff
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
        requires = 'nvim-treesitter/nvim-treesitter',
    }

    use 'windwp/nvim-ts-autotag'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'petertriho/cmp-git'

    -- snippents
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- use 'L3MON4D3/LuaSnip'
    -- use 'saadparwaiz1/cmp_luasnip'

    -- mason
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = "v3.x"
    }

    -- change the color of #fff in code
    use 'norcalli/nvim-colorizer.lua'

    -- discord presence
    -- use 'andweeb/presence.nvim'
    -- use 'IogaMaster/neocord'
    -- use '~/tmp/neocord'

    -- formatters ??
    use 'lukas-reineke/lsp-format.nvim'
    use 'nvimtools/none-ls.nvim'

    -- icons
    use 'nvim-tree/nvim-web-devicons'
    use 'onsails/lspkind.nvim'

    -- show error messages
    use 'folke/trouble.nvim'

    -- view hex files
    use 'RaafatTurki/hex.nvim'

    -- comments
    use 'numToStr/Comment.nvim'

    -- Ctrl-G
    use 'stevearc/aerial.nvim'

    -- json schemas
    use 'b0o/schemastore.nvim'

    use {
        'jinzhongjia/LspUI.nvim',
        branch = 'legacy',
    }

    -- status line
    use 'nvim-lualine/lualine.nvim'
    -- use 'linrongbin16/lsp-progress.nvim'
    use {
        'j-hui/fidget.nvim',
        tag = 'v1.4.0'
    }

    -- search
    -- use 'ggandor/leap.nvim'

    use 'mbbill/undotree'
    use {
        'kylechui/nvim-surround',
        tag = '*'
    }

    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn["mkdp#util#install"]() end
    }

    -- games
    use 'ThePrimeagen/vim-be-good'
end)
