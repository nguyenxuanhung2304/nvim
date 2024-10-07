return {
	"wojciech-kulik/xcodebuild.nvim",
	ft = { "swift", "objc" },
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("xcodebuild").setup({})
	end,
	cond = function()
		local cwd = vim.fn.getcwd()
		local xcodeproj_files = vim.fn.glob(cwd .. "/*.xcodeproj")
		return xcodeproj_files ~= ""
	end,
}
