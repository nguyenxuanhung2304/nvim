local present_nvim_treesitter, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present_nvim_treesitter then return end

nvim_treesitter.setup{}
