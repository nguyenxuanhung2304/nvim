return {
	"echasnovski/mini.indentscope",
	version = false,
	opts = {
		symbol = "│",
		options = { try_as_border = true },
	},
	init = function()
		local Util = require("user.core.utils")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = Util.ignore_filetypes(),
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
