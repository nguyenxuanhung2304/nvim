return {
	"nvim-lualine/lualine.nvim",
	event = "BufReadPre",
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
			lualine_a = { "mode" },
			lualine_b = {
				{
					"branch",
					icons_enabled = true,
					icon = "",
				},
			},
			lualine_c = {},
			lualine_x = {
				{
					function()
						local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
						return "Spaces: " .. shiftwidth
					end,
					padding = 1,
				},
				"filetype",
				{
					function()
						if rawget(vim, "lsp") then
							for _, client in ipairs(vim.lsp.get_active_clients()) do
								if client.attached_buffers[vim.api.nvim_get_current_buf()] then
									return string.format(" %s", client.name)
								end
							end
						end
					end,
				},
			},
			lualine_y = {
				{
					"location",
					padding = 0,
				},
			},
			lualine_z = { "progress" },
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
	},
}
