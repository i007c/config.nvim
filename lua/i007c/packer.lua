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
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
    }
    use 'nvim-telescope/telescope-project.nvim'

    use 'nvim-tree/nvim-tree.lua'
    use 'ThePrimeagen/harpoon'

    -- git
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- syntax stuff
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'petertriho/cmp-git'

    -- snippents
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- mason
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'VonHeikemen/lsp-zero.nvim'

    -- change the color of #fff in code
    use 'norcalli/nvim-colorizer.lua'

    -- discord presence
    use 'andweeb/presence.nvim'

    -- formatters ??
    use 'lukas-reineke/lsp-format.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- icons
    use 'nvim-tree/nvim-web-devicons'
    use 'onsails/lspkind.nvim'

    -- show error messages
    use 'folke/trouble.nvim'

    -- view hex files
    use 'RaafatTurki/hex.nvim'

    -- .http files
    use 'rest-nvim/rest.nvim'

    -- comments
    use 'numToStr/Comment.nvim'

    use 'stevearc/aerial.nvim'

    use 'b0o/schemastore.nvim'

    use 'jinzhongjia/LspUI.nvim'

end)
