local M = {}
local fn = vim.fn

local github_theme_color = {
  bg = '#ffffff',
  fg = '#24292E'
}
local latte_palette = require("catppuccin.palettes").get_palette "latte"
local lualine_color = {}

if (vim.g.colors_name == 'github_theme') then
  lualine_color = github_theme_color
end

if (vim.g.colors_name == 'catppuccin') then
  lualine_color = {
    fg = '24292e',
    bg = latte_palette.mantle
  }
end

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
  color = lualine_color
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

M.lsp = function()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        return string.format(" %s", client.name)
      end
    end
  end
end

return M
