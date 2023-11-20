local time = os.date("*t")
local currentHour = time.hour
local isEvening = currentHour > 18
local morningColorscheme = "gruvbox-material"
local diffviewColorscheme = "tokyonight"
local nightColorscheme = "gruvbox-baby"

vim.g.diffview_colorscheme = diffviewColorscheme

if isEvening then
	vim.g.gruvbox_baby_telescope_theme = 1 -- Enable telescope theme
	vim.g.main_colorscheme = nightColorscheme
	vim.cmd.colorscheme(nightColorscheme)
else
	vim.g.main_colorscheme = morningColorscheme
	vim.cmd.colorscheme(morningColorscheme)
end
