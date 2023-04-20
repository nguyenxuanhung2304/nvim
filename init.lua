vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require "user.plugins"
require "user.core.mappings"
require "user.core.options"
require "user.lsp"
require "user.core.autocmds"
