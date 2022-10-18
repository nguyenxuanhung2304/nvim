vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Dependences
  use "nvim-lua/plenary.nvim"
  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons

  -- Improve startup time for neovim
  use "lewis6991/impatient.nvim"

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    config = function()
      require "user.plugins.configs.telescope"
    end
  }

  use {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require "user.plugins.configs.telescope.project"
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  -- Explorer file and folder
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require "user.plugins.configs.nvim-tree"
    end
  }

  -- Dashboard
  use {
    'goolord/alpha-nvim',
    config = function ()
      require "user.plugins.configs.alpha"
    end
  }

  -- Utils
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "user.plugins.configs.indent-blankline"
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require "user.plugins.configs.comment"
    end
  }

  use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}

  use "famiu/bufdelete.nvim" -- Delete buffer like ctrl+w in vscode

  use "tpope/vim-surround"

  use {
    'mg979/vim-visual-multi',
    branch = 'master'
  }

  -- Syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require "user.plugins.configs.treesitter"
    end
  }

  -- Buffer
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    config = function()
      require "user.plugins.configs.bufferline"
    end
  }

  -- Themes
  use {
    'sam4llis/nvim-tundra',
    config = function ()
      require 'user.plugins.configs.themes.tundra'
    end
  }

  -- Status button line
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require "user.plugins.configs.lualine"
    end
  }

  -- Mason: like lsp-installer
  use {
    "williamboman/mason.nvim",
    config = function()
      require "user.plugins.configs.mason"
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
      require "user.plugins.configs.whichkey"
    end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require "user.plugins.configs.gitsigns"
    end
  }
  use "tpope/vim-fugitive"
  use {
    "f-person/git-blame.nvim",
    config = function ()
      require "user.plugins.configs.git-blame"
    end
  }
  use {
    "akinsho/git-conflict.nvim",
    tag = "*",
    config = function ()
      require "user.plugins.configs.git-conflict"
    end
  }

  -- Rails
  use "tpope/vim-endwise"
  use "tpope/vim-rails"
  use {
    "vim-test/vim-test",
    config = function ()
      require "user.plugins.configs.vim-test"
    end
  }

  -- Notify
  use {
    "rcarriga/nvim-notify",
    config = function()
      require "user.plugins.configs.notify"
    end
  }

  use {
    "sindrets/diffview.nvim",
    config = function ()
      require "user.plugins.configs.diffview"
    end
  }

  -- Markdown preview
  use "iamcco/markdown-preview.nvim"

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = '*', config = function()
      require("toggleterm").setup()
    end
  }

  use 'mattn/emmet-vim'
end)
