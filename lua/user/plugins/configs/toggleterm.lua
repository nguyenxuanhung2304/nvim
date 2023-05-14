local present, toggleterm = pcall(require, "toggleterm")
if not present then
  print("toggleterm not yet installed!")
end

toggleterm.setup {
  shade_terminals = false,
  direction = "float"
}
