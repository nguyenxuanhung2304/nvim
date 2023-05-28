return {
	{
		"neovim/nvim-lspconfig",
		opts = function()
			local signs = require("user.core.utils").signs()

			return {
				diagnostics = {
					-- disable virtual text
					virtual_text = true,
					-- show signs
					signs = {
						active = signs,
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
			}
		end,
		config = function()
			-- diagnostics
			local signs = require("user.core.utils").signs()

			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

			-- handlers
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
				width = 60,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
				width = 60,
			})

			-- attach servers
			local servers = { "solargraph", "tsserver", "eslint", "jsonls", "emmet_ls", "vuels", "lua_ls", "eslint" }
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local keymap = require("user.core.utils").keymap

			for _, server in pairs(servers) do
				local opts = {
					on_attach = function()
						keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
						keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
						keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
						keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
						keymap("n", "ga", "<cmd>Lspsaga code_action<CR>")
						keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
					end,
					capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
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
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
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
		event = "InsertEnter",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {},
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		opts = {
			symbol_in_winbar = {
				enable = true,
				separator = " ",
				ignore_patterns = {},
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				respect_root = false,
				color_mode = true,
			},
			ui = {
				kind = {
					["String"] = { " ", "String" },
					["Array"] = { "[]", "Array" },
				},
			},
			finder = {
				max_height = 0.5,
				min_width = 30,
				force_max_height = false,
				keys = {
					jump_to = "p",
					expand_or_jump = "o",
					vsplit = "<C-c>v",
					split = "<C-c>x",
					tabe = "<C-c>r",
					tabnew = "<C-c>t",
					quit = { "q", "<ESC>" },
					close_in_preview = "<ESC>",
				},
			},
			definition = {
				edit = "<C-c>o",
				vsplit = "<C-c>v",
				split = "<C-c>i",
				tabe = "<C-c>t",
				quit = "q",
			},
		},
	},
}
