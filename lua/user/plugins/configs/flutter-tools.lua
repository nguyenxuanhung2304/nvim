local present, flutter_tools = pcall(require, "flutter-tools")
if not present then return end

flutter_tools.setup {
  lsp = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
  }
}
