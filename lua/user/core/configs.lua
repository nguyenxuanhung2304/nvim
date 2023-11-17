local M = {}

M = {
	ignore_filetypes = {
		"help",
		"alpha",
		"dashboard",
		"lazy",
		"mason",
		"notify",
		"toggleterm",
		"netrw",
		"tutor",
		"NeogitStatus",
		"NeogitPopup",
		"DiffviewFiles",
	},
	icons = {
		diagnostics = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		},
	},
}

return M
