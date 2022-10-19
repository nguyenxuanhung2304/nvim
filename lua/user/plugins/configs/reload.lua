local reload = require('nvim-reload')

-- If you use Neovim's built-in plugin system
-- Or a plugin manager that uses it (eg: packer.nvim)
local plugin_dirs = vim.fn.stdpath('data') .. '/site/pack/*/start/*'

-- If you use vim-plug
-- local plugin_dirs = vim.fn.stdpath('data') .. '/plugged/*'

reload.lua_reload_dirs = {
    vim.fn.stdpath('user'),
    -- Note: the line below may cause issues reloading your config
    plugin_dirs
}

reload.files_reload_external = {
    vim.fn.stdpath('config') .. '/myfile.vim'
}

reload.modules_reload_external = { 'packer' }

reload.post_reload_hook = function()
    require('feline').reset_highlights()
end
