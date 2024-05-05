return {
	{
		"luisiacc/gruvbox-baby",
		branch = "main",
		lazy = true,
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
		"rockyzhang24/arctic.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		branch = "v2",
		lazy = true,
	},
	{
		"marko-cerovac/material.nvim",
		lazy = true,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {},
	},
	{
		"sainnhe/gruvbox-material",
		lazy = true,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
	},
	{
		"LunarVim/synthwave84.nvim",
		lazy = true,
	},
	{
		{ "rose-pine/neovim", name = "rose-pine", opts = {
			variant = "moon",
		} },
	},
	{
		'Mofiqul/vscode.nvim',
		lazy = true,
		opts = {
			italic_comments = true,
		}
	}
}
