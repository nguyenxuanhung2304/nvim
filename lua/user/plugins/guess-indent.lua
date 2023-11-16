local Configs = require("user.core.configs")

return {
	"nmac427/guess-indent.nvim",
	event = "BufReadPre",
	opts = {
		filetype_exclude = Configs.ignore_filetypes,
		buftype_exclude = {
			"help",
			"nofile",
			"terminal",
			"prompt",
		},
	},
}
