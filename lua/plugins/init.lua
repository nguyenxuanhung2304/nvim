vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  use "nvim-lua/plenary.nvim"

  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons


  -- Improve startup time for neovim
  use "lewis6991/impatient.nvim"

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    config = function()
      require "plugins.configs.telescope"
    end
  }

  use {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require "plugins.configs.telescope.project"
    end
  }

  -- Explorer file and folder
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require "plugins.configs.nvim-tree"
    end
  }

  -- Dashboard
  use {
    'goolord/alpha-nvim',
    config = function ()
      require "plugins.configs.alpha"
    end
  }

  -- Utils
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.configs.indent-blankline"
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require "plugins.configs.comment"
    end
  }

  use {
    "karb94/neoscroll.nvim",
    config = function()
      require "plugins.configs.neoscroll"
    end
  }

  use { "ggandor/lightspeed.nvim" } -- Motion

  use "famiu/bufdelete.nvim" -- Delete buffer like ctrl+w in vscode


  -- Syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require "plugins.configs.treesitter"
    end
  }

  -- Buffer
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    config = function()
      require "plugins.configs.bufferline"
    end
  }

  -- Themes
  use 'folke/tokyonight.nvim'
  use 'tomasiser/vim-code-dark'

  -- Status button line
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require "plugins.configs.lualine"
    end
  }

  -- Mason: like lsp-installer
  use {
    "williamboman/mason.nvim",
    config = function()
      require "plugins.configs.mason"
    end
  }

  use {
    "williamboman/mason-lspconfig.nvim"
  }

  -- Lsp config
  use {
    'neovim/nvim-lspconfig'
  }

  use "jose-elias-alvarez/null-ls.nvim"

  -- Cmp
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer words
  use "hrsh7th/cmp-path" -- filesystem paths
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  use {
    "folke/trouble.nvim"
  }

  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require "plugins.configs.whichkey"
    end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require "plugins.configs.gitsigns"
    end
  }

  use "tpope/vim-fugitive"

  -- Rails
  use "tpope/vim-endwise"
  use "tpope/vim-rails"
end)
