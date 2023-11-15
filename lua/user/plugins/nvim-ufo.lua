return {
	"kevinhwang91/nvim-ufo",
	event = { "BufReadPre" },
	dependencies = { "kevinhwang91/promise-async" },
	opts = {},
	keys = {
		{ "<Leader>zR", "<cmd>lua require('ufo').openAllFolds()<CR>", desc = "Open all folds" },
		{ "<Leader>zM", "<cmd>lua require('ufo').closeAllFolds()<CR>", desc = "Close all folds" },
		{ "<Leader>zr", "<cmd>lua require('ufo').openFoldsExceptKinds()<CR>" },
		{ "<Leader>zm", "<cmd>lua require('ufo').closeFoldsWith()<CR>" },
		{ "<Leader>zp", "<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>", desc = "Preview fold " },
	},
}
