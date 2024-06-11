local utils = require("user.core.utils")

return {
	"backdround/global-note.nvim",
	opts = {
		filename = "global.md",
		directory = "~/notes/",
		additional_presets = {
			project = {
				filename = function()
					return utils.get_project_name() .. ".md"
				end,
				title = "Project",
				command_name = "ProjectNote",
			},

			todo = {
				filename = "todos.md",
				title = "Todo",
				command_name = "TodoNote",
			},
		},
	},
	keys = {
		{
			"<leader>Ng",
			function()
				require("global-note").toggle_note()
			end,
			desc = "Global note",
		},
		{
			"<leader>Np",
			function()
				require("global-note").toggle_note("project")
			end,
			desc = "Project note",
		},
		{
			"<leader>Nt",
			function()
				require("global-note").toggle_note("note")
			end,
			desc = "Todo note",
		},
	},
}
