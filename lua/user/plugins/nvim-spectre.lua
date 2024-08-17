return {
	"nvim-pack/nvim-spectre",
	lazy = true,
	keys = {
		{ "<leader>sg", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
		{
			"<leader>sw",
			'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
			desc = "Search current word",
		},
		{
			"<leader>sw",
			'<esc><cmd>lua require("spectre").open_visual()<CR>',
			desc = "Search current word",
			mode = "v",
		},
	},
}
