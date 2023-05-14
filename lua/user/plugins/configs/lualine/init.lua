local present, lualine = pcall(require, "lualine")
if not present then
  print("lualine not yet installed!")
  return
end

local components = require "user.plugins.configs.lualine.components"

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { components.branch },
    lualine_c = { components.cwd },
		lualine_x = { components.spaces, 'filetype', components.lsp },
		lualine_y = { components.location },
		lualine_z = { components.progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
