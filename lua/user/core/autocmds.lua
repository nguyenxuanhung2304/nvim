vim.cmd([[
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
]])

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.o.autoread = true
            vim.opt.updatetime = 1000
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

