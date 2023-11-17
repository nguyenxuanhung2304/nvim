return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = {
			"html",
			"css",
			"vue",
			"sass",
			"scss",
		},
		user_default_options = {
			mode = "background",
			tailwind = true,
		},
	},
}
