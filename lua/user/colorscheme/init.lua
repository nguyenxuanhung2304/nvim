require "user.colorscheme.themes.github"

vim.cmd[[colorscheme github_dark]]

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

  hi Cursor guifg=NONE guibg=NONE
  hi CursorLine guifg=NONE guibg=NONE
]]
