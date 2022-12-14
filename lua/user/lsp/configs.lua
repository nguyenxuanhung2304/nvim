local present,mason_config = pcall(require, "mason-lspconfig")

if not present then
	return
end

local present_lspconfig, lspconfig = pcall(require, "lspconfig")
if not present_lspconfig then return end

local servers = { "sumneko_lua", "solargraph", "tsserver", "eslint", "jsonls", "emmet_ls", "vuels" }

mason_config.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
