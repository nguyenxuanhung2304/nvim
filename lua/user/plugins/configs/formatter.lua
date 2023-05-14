local present, formatter = pcall(require, "formatter")

if not present then
  print("formatter not yet installed!")
	return
end

local languages = require("formatter.filetypes")
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			languages.lua.stylua,
		},

		ruby = {
			languages.ruby.rubocop,
		},

		eruby = {
			languages.html.prettier,
		},

		html = {
			languages.html.prettier,
		},

		javascript = {
			languages.javascript.prettier,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
