return {
	{
		"luisiacc/gruvbox-baby",
		branch = "main",
		init = function()
			local currentColorscheme = vim.g.colors_name
			if currentColorscheme ~= "gruvbox-baby" then
				return
			end

			local colors = require("gruvbox-baby.colors").config()

			vim.api.nvim_set_hl(
				0,
				"BufferLineBufferSelected",
				{ fg = colors.gray, bg = colors.none, italic = true, sp = "#242424" }
			)
			vim.api.nvim_set_hl(
				0,
				"BufferLineCloseButtonSelected",
				{ fg = colors.gray, bg = colors.none, italic = true, sp = "#242424" }
			)
			vim.api.nvim_set_hl(
				0,
				"BufferLineDevIconLuaSelected",
				{ fg = colors.blue_gray, bg = colors.none, italic = true, sp = "#242424" }
			)

			vim.api.nvim_set_hl(
				0,
				"BufferLineDevIconLuaInactive",
				{ fg = colors.blue_gray, bg = colors.none, italic = true, sp = "#242424" }
			)
			vim.api.nvim_set_hl(
				0,
				"BufferLineBufferVisible",
				{ fg = colors.comment, bg = colors.none, italic = true, sp = "#242424" }
			)
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_dim_inactive_windows = 1
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
