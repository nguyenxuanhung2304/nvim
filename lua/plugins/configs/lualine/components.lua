local M = {}

local lualine_color = {
 fg = '#ffffff', bg = '#24292E'
}

local git_blame = require('gitblame')

M.diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
  color = { fg = '#ffffff', bg = '#24292E'}
}

M.branch = {
	"branch",
	icons_enabled = true,
	icon = "",
  color = lualine_color
}

M.location = {
	"location",
	padding = 0,
  color = lualine_color
}

M.spaces = {
  function()
    local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
    return "Spaces: " .. shiftwidth
  end,
  padding = 1,
  color = lualine_color
}

M.filename = {
  "filename",
  path = 1,
  color = lualine_color
}

M.progress = {
  "progress",
  color = lualine_color
}

M.gitBlame = {
  git_blame.get_current_blame_text,
  cond = git_blame.is_blame_text_available,
  color = lualine_color
}

return M
