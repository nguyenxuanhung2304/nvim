local time = os.date("*t")
local currentHour = time.hour
local isEvening = currentHour > 18

if isEvening then
  vim.g.gruvbox_baby_telescope_theme = 1 -- Enable telescope theme
  vim.cmd('colorscheme gruvbox-baby')
else
  vim.cmd('colorscheme tokyonight')
end
