return {
	"nmac427/guess-indent.nvim",
	event = "BufReadPre",
	opts = {
		filetype_exclude = {
			"netrw",
			"tutor",
      "alpha",
      "lazy",
      "DiffviewFiles",
      "NeogitStatus",
      "NeogitPopup"
		},
		buftype_exclude = {
			"help",
			"nofile",
			"terminal",
			"prompt",
		},
	},
}
