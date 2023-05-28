return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		},
	},
	{
		"tree-sitter/tree-sitter-embedded-template",
		event = "BufRead",
	},
}
