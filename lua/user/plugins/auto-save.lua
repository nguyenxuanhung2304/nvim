return {
	"Pocco81/auto-save.nvim",
	event = "BufReadPre",
	opts = {
		execution_message = {
			message = "",
			dim = 0.18,
			cleaning_interval = 200,
		},
	},
	cond = function ()
		local cur_buf_filetype = vim.bo.filetype
		local is_oil = cur_buf_filetype == 'oil'

		return is_oil
	end
}
