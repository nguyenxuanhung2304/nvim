vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lua/plenary.nvim"

  use "lewis6991/impatient.nvim"

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  
  -- Theme like monokai of sublime text
  use {
    'ofirgall/ofirkai.nvim',
    config = function() 
      require'ofirkai'.setup{}
    end
  }
  
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    config = function()
      require "plugins.configs.telescope"
    end
  }
  use { 
    "nvim-telescope/telescope-file-browser.nvim",
    config = function() 
      require("telescope").load_extension "file_browser"
    end
  }

end)
