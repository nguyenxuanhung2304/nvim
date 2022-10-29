local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

local components = require "user.plugins.configs.lualine.components"
local transparent = require "user.plugins.configs.lualine.transparent"
local lualine_theme

if (vim.g.colors_name == 'gruvbox') then
  lualine_theme = 'gruvbox'
else
  lualine_theme = transparent.theme()
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = lualine_theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { components.branch },
		lualine_b = { components.diagnostics },
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
