local present, telescope = pcall(require, "telescope")
if not present then
  print("Telescope not yet installed!")
  return
end

telescope.setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}
