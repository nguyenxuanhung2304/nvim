local present, nvim_tree = pcall(require, "nvim-tree")

if not present then
  print "Nvim-tree is not installed yet!"
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  filters = {
    custom = {
      "^.git$"
    },
    dotfiles = false
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          -- arrow_open = " ",
          -- arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      }
    },
    indent_markers = {
      enable = true
    }
  },
  git = {
    ignore = false
  }
}
