local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever save the plugins/init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/user/plugins/init.lua source <afile>
  augroup end
]])

local present, packer = pcall(require, 'packer')
if not present then return end

-- Open packer in float rounded
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end
  }
}

-- Plugins
return packer.startup(function(use)
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
    end,
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  }
  use {
    'camgraff/telescope-tmux.nvim'
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    config = function()
      require "user.plugins.configs.nvim-tree"
    end,
    event = "BufRead"
  }

  -- Dashboard
  use {
    'goolord/alpha-nvim',
    config = function()
      require "user.plugins.configs.alpha"
    end
  }

  -- Utils
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "user.plugins.configs.indent-blankline"
    end,
    event = "BufRead"
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
    event = "BufRead"
  }

  use {
    'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
      require "user.plugins.configs.comment"
    end
  }

  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
    event = "BufRead"
  }

  use {
    "famiu/bufdelete.nvim",
    event = "BufRead"
  }

  -- use "tpope/vim-surround"
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
    event = "BufRead"
  })

  use {
    'RRethy/vim-hexokinase',
    run = 'make hexokinase',
    config = function ()
      require "user.plugins.configs.vim-hexokinase"
    end,
  }

  use {
    'mg979/vim-visual-multi',
    branch = 'master',
    event = "BufRead"
  }

  -- Syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require "user.plugins.configs.nvim-treesitter"
    end,
    event = "BufRead"
  }

  -- Buffer
  use {
    'akinsho/bufferline.nvim',
    event = "BufRead",
    tag = "v2.*",
    config = function()
      require "user.plugins.configs.bufferline"
    end
  }

  -- Highlight word under cursor
  use {
    'RRethy/vim-illuminate',
    config = function()
      require "user.plugins.configs.vim-illuminate"
    end
  }

  use {
    'mhartington/formatter.nvim',
    config = function()
      require "user.plugins.configs.formatter"
    end,
    event = "BufRead"
  }

  -- Themes
  use {
    'luisiacc/gruvbox-baby',
    branch = "main"
  }
  use {
    'sainnhe/gruvbox-material'
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
  use {
    'neovim/nvim-lspconfig'
  }
  use "jose-elias-alvarez/null-ls.nvim"

  -- Cmp
  use {
    "hrsh7th/cmp-nvim-lsp",
  }
  use {
    "hrsh7th/nvim-cmp",
  }
  use { -- buffer words
    "hrsh7th/cmp-buffer",
    event = "BufRead"
  }
  use { -- filesystem paths
    "hrsh7th/cmp-path",
    event = "BufRead"
  }
  use {
    "hrsh7th/cmp-nvim-lua",
    event = "BufRead"
  }
  use {
    "saadparwaiz1/cmp_luasnip",
    event = "BufRead"
  }
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require "user.plugins.configs.lspsaga"
    end,
    event = "BufRead"
  }
  use {
    "onsails/lspkind.nvim",
    event = "BufRead"
  }

  -- Snippets
  use {
    "L3MON4D3/LuaSnip",
  }
  use {
    "rafamadriz/friendly-snippets",
  }
  use {
    "folke/trouble.nvim",
    event = "BufRead"
  }

  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require "user.plugins.configs.whichkey"
    end,
    event = "BufWinEnter"
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require "user.plugins.configs.gitsigns"
    end,
    event = "BufRead",
  }
  use "tpope/vim-fugitive"
  use {
    "f-person/git-blame.nvim",
    config = function()
      require "user.plugins.configs.git-blame"
    end,
    event = "BufRead"
  }
  use {
    "akinsho/git-conflict.nvim",
    tag = "*",
    config = function()
      require "user.plugins.configs.git-conflict"
    end,
    event = "BufRead"
  }

  -- Rails
  use {
    "tpope/vim-endwise",
    event = "BufRead"
  }
  use "tpope/vim-rails"
  use {
    "tree-sitter/tree-sitter-embedded-template",
    event = "BufRead"
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
    config = function()
      require "user.plugins.configs.diffview"
    end,
    event = "BufWinEnter"
  }

  -- Markdown preview
  use {
    "iamcco/markdown-preview.nvim",
    event = "BufRead"
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    tag = '*', config = function()
      require "user.plugins.configs.toggleterm"
    end
  }

  use {
    'mattn/emmet-vim',
    config = function()
      require "user.plugins.configs.emmet"
    end,
    event = "BufRead"
  }

  -- Automatically set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
