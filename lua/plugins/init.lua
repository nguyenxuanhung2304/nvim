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

end)
