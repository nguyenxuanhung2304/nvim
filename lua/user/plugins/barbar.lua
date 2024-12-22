return {
	"romgrk/barbar.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
