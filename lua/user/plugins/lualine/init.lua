local lualine_components = require("user.plugins.lualine.components")

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "Outline" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = {
				lualine_components.branch(),
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {
				lualine_components.spaces(),
				"filetype",
				lualine_components.lsp(),
			},
			lualine_y = {
				lualine_components.location(),
			},
			lualine_z = { lualine_components.progress() },
		},
		winbar = {
			lualine_c = {
				lualine_components.outline(),
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	},
}
