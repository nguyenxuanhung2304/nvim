return {
	"tzachar/local-highlight.nvim", -- highlight under word
	event = "BufReadPre",
	opts = {
		disable_file_types = {
			"log",
      "lazy"
		},
	},
}
