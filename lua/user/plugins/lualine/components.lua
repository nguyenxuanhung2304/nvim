local M = {}

function M.branch()
	return {
		"branch",
		icons_enabled = true,
		icon = "",
	}
end

function M.filename()
	return {
		"filename",
		path = 1,
	}
end

function M.spaces()
	local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
	local _spaces = "Spaces: " .. shiftwidth

	return {
		_spaces,
		padding = 1,
	}
end

function M.lsp()
	return {
		function()
			if rawget(vim, "lsp") then
				for _, client in ipairs(vim.lsp.get_clients()) do
					if client.attached_buffers[vim.api.nvim_get_current_buf()] then
						return string.format(" %s", client.name)
					end
				end
			end
		end,
	}
end

function M.location()
	return {
		"location",
		padding = 0,
	}
end

function M.progress()
	return {
		"progress",
		padding = 0,
	}
end

function M.outline()
	return {
		"navic",
		color_correction = nil,
		navic_opts = nil,
	}
end

return M
