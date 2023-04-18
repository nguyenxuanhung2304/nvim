local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then return end

local textobjects = require("user.plugins.configs.nvim-treesitter.textobjects")

nvim_treesitter.setup {
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  textobjects = textobjects,
}
