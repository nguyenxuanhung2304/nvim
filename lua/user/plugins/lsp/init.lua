local Configs = require("user.core.configs")

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
			{ "SmiteshP/nvim-navic" },
		},
		opts = function()
			return {
				diagnostics = {
					-- disable virtual text
					virtual_text = true,
					-- show signs
					signs = {
						active = Configs.icons.diagnostics,
					},
					update_in_insert = true,
					underline = true,
					severity_sort = true,
					float = {
						focusable = false,
						style = "minimal",
						border = "rounded",
						source = "always",
						header = "",
						prefix = "",
					},
				},
				inlay_hints = { enabled = true },
			}
		end,
		init = function()
			vim.g.coq_settings = {
				auto_start = true,
				display = {
					icons = {
						mode = "short",
					},
				},
			}
		end,
		config = function()
			-- diagnostics
			for _, sign in ipairs(Configs.icons.diagnostics) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

			-- attach servers
			local servers = {
				"solargraph",
				"phpactor",
				"tsserver",
				"eslint",
				"jsonls",
				"emmet_ls",
				"vuels",
				"lua_ls",
				"dartls",
				"pyright",
				"tailwindcss",
				"sourcekit",
			}

			local lspconfig = require("lspconfig")
			local navic = require("nvim-navic")
			local keymap = require("user.core.utils").keymap

			for _, server in pairs(servers) do
				local opts = {
					on_attach = function(client, buffer)
						keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
						keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
						keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
						keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")

						navic.attach(client, buffer)
					end,
				}
				local has_custom_opts, server_custom_opts = pcall(require, "user.plugins.lsp.settings." .. server)
				if has_custom_opts then
					opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
				end
				lspconfig[server].setup(opts)
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				"clang_format",
				"clangd",
				"cspell",
				"css_lsp",
				"deno",
				"html_lsp",
				"kotlin_language_server",
				"lua_language_server",
				"phpactor",
				"prettier",
				"rubocop",
				"solargraph",
				"stylua",
				"typescript_language_server",
				"vetur_vls",
				"vue-language-server",
			},
			ui = {
				border = "rounded",
			},
			PATH = "prepend",
		},
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting

			return {
				debug = false,
				sources = {
					formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
					formatting.black.with({ extra_args = { "--fast" } }),
				},
			}
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"onsails/lspkind.nvim",
		event = "BufReadPre",
	},
}
