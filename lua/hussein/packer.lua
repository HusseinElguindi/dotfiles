vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {'sonph/onehalf', rtp = 'vim/'}

    use {
        'preservim/nerdtree',
        requires = { 'ryanoasis/vim-devicons', opt = true }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons'
        }
    }
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    use { 'junegunn/fzf.vim' }

    use {
        'kyazdani42/nvim-web-devicons',
        module = "nvim-web-devicons",
    }

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    --use('nvim-treesitter/playground')
    use 'mbbill/undotree'

    use {
        'SirVer/ultisnips',
        requires = {'quangnguyen30192/cmp-nvim-ultisnips'}
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'tpope/vim-commentary'

    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'

    use 'jiangmiao/auto-pairs'
end)

