vim.api.nvim_create_user_command("TeleSmartOpen", function()
	require("telescope").extensions.smart_open.smart_open()
end, { desc = "Open smart-open" })

vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
