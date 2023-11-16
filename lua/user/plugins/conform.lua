return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { { "prettierd", "prettier" } },
			ruby = {
				"rubocop",
			},
			eruby = {
				"prettier",
			},
			html = {
				"prettier",
			},
			dart = {
				"dartformat",
			},
			vue = {
				"prettier",
			},
			css = {
				"prettier",
			},
			json = {
				"prettier",
			},
		},
	},
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
}
