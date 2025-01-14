local M = {}

function M.keymap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	vim.keymap.set(mode, lhs, rhs, options)
end

function M.signs()
	return {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}
end

function M.on_load(name, fn)
	local Config = require("lazy.core.config")
	if Config.plugins[name] and Config.plugins[name]._.loaded then
		fn(name)
	else
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyLoad",
			callback = function(event)
				if event.data == name then
					fn(name)
					return true
				end
			end,
		})
	end
end

function M.get_relative_path()
	local path = vim.fn.expand("%:~:.")
	return path ~= "" and path or "[No Name]"
end

M.get_winbar = function()
	local navic = require("nvim-navic")
	local relative_path = M.get_relative_path()
	local navic_location = navic.is_available() and navic.get_location() or ""

	if navic_location ~= "" then
		return relative_path .. " > " .. navic_location
	end
	return relative_path
end

return M
