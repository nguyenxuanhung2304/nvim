return {
  { "nvim-lua/plenary.nvim" },
  { "lewis6991/impatient.nvim" },
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    lazy = false,
    config = function ()
      require "user.theme.init"
    end
  },
  {
    'luisiacc/gruvbox-baby',
    branch = 'main',
    lazy = true
  },
  {
    'ibhagwan/fzf-lua',
    config = function()
      require "user.plugins.configs.fzf"
    end
  },
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require "user.plugins.configs.nvim-tree"
    end,
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require "user.plugins.configs.alpha"
    end
  },
  {
    'p00f/nvim-ts-rainbow',
    event = "BufWinEnter"
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {}
    end,
    event = "InsertEnter"
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "user.plugins.configs.indent-blankline"
    end,
  },
  {
    'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
      require "user.plugins.configs.comment"
    end
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
    event = "BufRead"
  },

  {
    "famiu/bufdelete.nvim",
    event = "BufRead"
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
    event = "BufRead"
  },

  {
    'RRethy/vim-hexokinase',
    run = 'make hexokinase',
    config = function()
      require "user.plugins.configs.vim-hexokinase"
    end,
  },

  {
    'mg979/vim-visual-multi',
    branch = 'master',
    event = "BufRead"
  },

  -- Syntax highlight
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require "user.plugins.configs.nvim-treesitter"
    end,
  },
  { "RRethy/nvim-treesitter-textsubjects" },

  -- Buffer
  {
    'akinsho/bufferline.nvim',
    event = "BufRead",
    config = function()
      require "user.plugins.configs.bufferline"
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require "user.plugins.configs.lualine"
    end
  },

  -- Highlight word under cursor
  {
    'RRethy/vim-illuminate',
    config = function()
      require "user.plugins.configs.vim-illuminate"
    end
  },

  {
    'mhartington/formatter.nvim',
    config = function()
      require "user.plugins.configs.formatter"
    end,
    event = "BufRead"
  },

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
    event = "BufRead"
  },

  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require "user.plugins.configs.nvim-hlslens"
    end
  },

  -- Cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
    }
  },

  -- Lsp
  {
    'neovim/nvim-lspconfig',
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require "user.plugins.configs.mason"
    end
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    opt = true,
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
  },
  {
    "onsails/lspkind.nvim",
    event = "InsertEnter"
  },
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
  },
  {
    "rafamadriz/friendly-snippets",
  },

  -- Which key
  {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = function()
      require "user.plugins.configs.whichkey"
    end
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require "user.plugins.configs.gitsigns"
    end,
    event = 'BufRead',
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gtabedit",
      "Gdiff"
    }
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      require "user.plugins.configs.git-blame"
    end,
    event = "BufRead"
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require "user.plugins.configs.git-conflict"
    end,
    event = "InsertEnter"
  },

  -- Rails
  {
    "tree-sitter/tree-sitter-embedded-template",
    event = "BufRead"
  },

  {
    'mattn/emmet-vim',
    config = function()
      require "user.plugins.configs.emmet"
    end,
    event = "BufRead"
  },
}
