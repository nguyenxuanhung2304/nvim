local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

nvim_treesitter.setup {}
