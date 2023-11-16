local Util = require("user.core.utils")

return {
	"nmac427/guess-indent.nvim",
	event = "BufReadPre",
	opts = {
		filetype_exclude = Util.ignore_filetypes(),
		buftype_exclude = {
			"help",
			"nofile",
			"terminal",
			"prompt",
		},
	},
}
