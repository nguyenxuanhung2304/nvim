local present, lspsaga = pcall(require, "lspsaga")
if not present then
  print("Lspsaga not found!")
  return
end

lspsaga.setup {
  symbol_in_winbar = {
    enable = true,
    separator = " ",
    ignore_patterns={},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  ui = {
    kind = {
      ["String"] = { " ", "String" },
      ["Array"] = { '[]', 'Array' },
    }
  },
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      jump_to = 'p',
      expand_or_jump = 'o',
      vsplit = '<C-c>v',
      split = '<C-c>x',
      tabe = '<C-c>r',
      tabnew = '<C-c>t',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },
  definition = {
    edit = "<C-c>o",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
  }
}
