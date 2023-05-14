local present_mason, mason = pcall(require, "mason")
local present_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")

if not present_mason or present_mason_lspconfig then
  print("mason or mason-lspconfig not yet installed!")
  return
end


mason.setup({
  ui = {
    border = "rounded"
  }
})
mason_lspconfig.setup()
