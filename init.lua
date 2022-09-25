vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require "plugins"
require "core.mappings"
require "core.options"
require "colorscheme"
require "plugins.configs.lsp"
require "plugins.configs.cmp"
