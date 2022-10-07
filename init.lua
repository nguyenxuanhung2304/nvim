vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require "user.plugins"
require "user.core.mappings"
require "user.core.options"
require "user.colorscheme"
require "user.plugins.configs.lsp"
require "user.plugins.configs.cmp"
