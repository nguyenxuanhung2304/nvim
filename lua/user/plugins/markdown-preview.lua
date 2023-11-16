return {
	"iamcco/markdown-preview.nvim",
	cmd = {
		"MarkdownPreview",
	},
	config = function()
		vim.fn["mkdp#util#install"]()
	end,
}
