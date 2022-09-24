local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

nvim_treesitter.setup {
  autotag = {
    enable = true
  },
  ensure_installed = { "ruby", "vue", "js", "json", "erb"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,
}
