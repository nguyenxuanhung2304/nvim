vim.cmd[[
  set background=dark
  let g:gruvbox_material_background = 'medium'
  let g:gruvbox_material_better_performance = 1
  colorscheme gruvbox-material
]]

vim.cmd [[
  hi DiffAddNoBg guibg=NONE ctermbg=4 guifg=#56d364
  hi DiffviewStatusDeletedNoBg guibg=NONE
  hi DiffChangedNoBg guibg=NONE ctermbg=5 guifg=#e3b341
  hi DiffviewStatusRenamedNoBg guibg=NONE
  hi DiffviewStatusTypeChangeNoBg guibg=NONE
  hi DiffviewStatusUnmergedNoBg guibg=NONE

  hi link DiffviewStatusAdded DiffAddNoBg
  hi link DiffviewStatusDeleted DiffviewStatusDeletedNoBg
  hi link DiffviewStatusChanged DiffChangedNoBg
  hi link DiffviewStatusModified DiffChangedNoBg

  hi Cursor guibg=#fbf1c7
]]
