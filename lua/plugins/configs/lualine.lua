local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
  color = { fg = '#ffffff', bg = '#24292E'}
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
  color = { fg = '#ffffff', bg = '#24292E'}
}

local location = {
	"location",
	padding = 0,
  color = { fg = '#ffffff', bg = '#24292E'}
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
      branch,
      diagnostics
    },
		lualine_b = {
      {
        '',
        color = { fg = '#ffffff', bg = '#24292E' }
      }
    },
    lualine_c = {
      {
        '',
        color = { fg = '#ffffff', bg = '#24292E' }
      }
    },
		lualine_x = {
      {
        'filename',
        path = 1,
        color = { fg = '#ffffff', bg = '#24292E' }
      }
    },
		lualine_y = {
      location,
    },
		lualine_z = {
      {
        '',
        color = { fg = '#ffffff', bg = '#24292E' }
      }
    },
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
