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
  use { 'wbthomason/packer.nvim' }
  use "nvim-lua/plenary.nvim"
  use "lewis6991/impatient.nvim"

  use {
    'kyazdani42/nvim-web-devicons',
  }

  -- Themes
  use {
    'luisiacc/gruvbox-baby',
    branch = 'main'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    config = function()
      require "user.plugins.configs.telescope"
    end,
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require "user.plugins.configs.nvim-tree"
    end,
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
    'p00f/nvim-ts-rainbow',
    event = "BufWinEnter"
  }

  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {}
    end,
    event = "InsertEnter"
  })

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "user.plugins.configs.indent-blankline"
    end,
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
    config = function()
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

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require "user.plugins.configs.lualine"
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

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
    event = "BufRead"
  }

  use {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require "user.plugins.configs.nvim-hlslens"
    end
  }

  -- Cmp
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use {
    "hrsh7th/cmp-buffer",
    event = "InsertEnter"
  }
  use {
    "hrsh7th/cmp-path",
    event = "InsertEnter"
  }
  use {
    "hrsh7th/cmp-nvim-lua",
  }
  use {
    "saadparwaiz1/cmp_luasnip",
  }

  -- Lsp
  use {
    'neovim/nvim-lspconfig',
  }
  use {
    "williamboman/mason.nvim",
    config = function()
      require "user.plugins.configs.mason"
    end
  }
  use { "williamboman/mason-lspconfig.nvim" }
  --use {
    --"glepnir/lspsaga.nvim",
    --branch = "main",
    --config = function()
      --require "user.plugins.configs.lspsaga"
    --end,
  --}
  use {
    "onsails/lspkind.nvim",
  }
  -- Snippets
  use {
    "L3MON4D3/LuaSnip",
  }

  use {
    "rafamadriz/friendly-snippets",
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
    event = 'BufRead',
  }
  use {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gtabedit",
      "Gdiff"
    }
  }
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
    event = "BufWinEnter"
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
    end,
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
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
