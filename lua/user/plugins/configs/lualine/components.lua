local M = {}

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

M.branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

M.location = {
  "location",
  padding = 0,
}

M.spaces = {
  function()
    local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
    return "Spaces: " .. shiftwidth
  end,
  padding = 1,
}

M.filename = {
  "filename",
  path = 1,
}

M.progress = {
  "progress",
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
