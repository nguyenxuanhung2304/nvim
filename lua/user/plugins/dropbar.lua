return {
	"Bekaboo/dropbar.nvim",
	event = "BufReadPre",
	opts = {
		icons = {
			ui = {
				bar = {
					separator = "  ",
				},
			},
		},
		menu = {
			win_configs = {
				border = "single",
			},
		},
	},
}
