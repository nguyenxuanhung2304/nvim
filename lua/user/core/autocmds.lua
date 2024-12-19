vim.cmd([[
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
]])

vim.o.autoread = true
vim.opt.updatetime = 1000
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd('checktime')
        end
    end
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    pattern = "*",
    callback = function()
        vim.api.nvim_echo({
            { "File changed on disk. Buffer reloaded.", "WarningMsg" }
        }, true, {})
    end
})
-- local luasnip_fix_augroup = vim.api.nvim_create_augroup("MyLuaSnipHistory", { clear = true })
-- vim.api.nvim_create_autocmd("ModeChanged", {
-- 	pattern = "*",
-- 	callback = function()
-- 		if
-- 			((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
-- 			and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
-- 			and not require("luasnip").session.jump_active
-- 		then
-- 			require("luasnip").unlink_current()
-- 		end
-- 	end,
-- 	group = luasnip_fix_augroup,
-- })
