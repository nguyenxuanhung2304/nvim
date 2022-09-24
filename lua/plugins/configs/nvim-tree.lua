local present, nvim_tree = pcall(require, "nvim-tree")

if not present then
  print "Nvim-tree is not installed yet!"
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
  filters = {
    custom = {
      "^.git$"
    }
  }
}
