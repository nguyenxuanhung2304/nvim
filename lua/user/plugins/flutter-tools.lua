return {
	"akinsho/flutter-tools.nvim",
	ft = "dart",
	opts = {
		lsp = {
			settings = {
				analysisExcludedFolders = { "vim.fn.expand('$HOME/flutter/.pub-cache')" },
			},
		},
	},
}
