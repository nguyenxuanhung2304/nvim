return {
	"echasnovski/mini.indentscope",
	version = false,
	opts = {
		symbol = "│",
		options = { try_as_border = true },
	},
	init = function()
		local Configs = require("user.core.configs")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = Configs.ignore_filetypes,
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
