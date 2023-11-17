return {
	"echasnovski/mini.files",
	lazy = true,
	version = false,
	opts = {},
	keys = {
		{
			"<leader>e",
			function()
				local MiniFiles = require("mini.files")

				if not MiniFiles.close() then
					MiniFiles.open()
				end
			end,
			desc = "Toggle file explore",
		},
	},
}
