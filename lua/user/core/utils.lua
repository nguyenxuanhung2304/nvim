local M = {}

function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
      options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.eval()
  local except_filetype = {"toggleterm", "fugitive"}
  local filetype = vim.bo.filetype
  for _, value in ipairs(except_filetype) do
    if value == filetype then return '' end
  end

  local file_path = vim.api.nvim_eval_statusline('%f', {}).str
  local modified = vim.api.nvim_eval_statusline('%M', {}).str == '+' and '⊚' or ''

  file_path = file_path:gsub('/', ' > ')

  return '%#WinBarPath#'
   .. file_path
   .. '%*'
   .. '%#WinBarModified#'
   .. modified
   .. '%*'
end

return M
