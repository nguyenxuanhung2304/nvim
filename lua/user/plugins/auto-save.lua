return {
	"Pocco81/auto-save.nvim",
	event = "BufReadPre",
	opts = {
		execution_message = {
			message = "",
			dim = 0.18, -- dim the color of `message`
			cleaning_interval = 200, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
		},
	},
}
