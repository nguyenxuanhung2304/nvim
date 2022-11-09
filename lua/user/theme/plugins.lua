local M = {}
local config = require("user.core.config")

M.init = function(use)
  use {
    'luisiacc/gruvbox-baby',
    as = 'gruvbox-baby',
    branch = "main",
    config = function()
      vim.cmd("color gruvbox-baby")
    end,
    disable = config.theme ~= 'gruvbox-baby'
  }

  use {
    'sainnhe/gruvbox-material',
    as = 'gruvbox-material',
    config = function()
      vim.cmd [[
        let g:gruvbox_material_background = 'medium' " soft | medium | hard
        let g:gruvbox_material_foreground = 'material' " mix | original | material
        let g:gruvbox_material_transparent_background = 0

        " For better performance
        let g:gruvbox_material_better_performance = 1
      ]]
    end,
    disable = config.theme ~= 'gruvbox-material'
  }

  use({ -- color scheme
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function()
      vim.g.tokyonight_style = 'storm'
      vim.g.tokyonight_sidebars = { 'qf' }
      vim.cmd('color tokyonight')
    end,
    commit = '8223c970677e4d88c9b6b6d81bda23daf11062bb',
    disable = config.theme ~= 'tokyonight',
  })
end

return M
