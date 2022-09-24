vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lua/plenary.nvim"

  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons


  -- Improve startup time for neovim
  use "lewis6991/impatient.nvim"

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  
  use 'Mofiqul/vscode.nvim'
  
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    config = function()
      require "plugins.configs.telescope"
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
end)
