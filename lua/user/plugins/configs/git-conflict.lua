local present, git_conflict = pcall(require, "git-conflict")

if not present then
  print("git-conflict not yet installed!")
  return
end

vim.cmd [[ 
  hi GitconflictCurrent guibg=#307365 ctermbg=4 guifg=#ffffff
  hi GitconflictIncoming guibg=#2F628D ctermbg=4 guifg=#ffffff
]]

git_conflict.setup {
  default_mappings = true, -- disable buffer local mapping created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = 'GitconflictIncoming',
    current = 'GitconflictCurrent',
  }
}
