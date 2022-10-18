local present,mason_config = pcall(require, "mason-lspconfig")

if not present then
	return
end

local lspconfig = require("lspconfig")

local servers = { "sumneko_lua", "solargraph", "tsserver", "eslint" }

mason_config.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.plugins.configs.lsp.handlers").on_attach,
		capabilities = require("user.plugins.configs.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.plugins.configs.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end

lspconfig['eslint'].setup({})
