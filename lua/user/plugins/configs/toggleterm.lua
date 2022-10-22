local present, toggleterm = pcall(require, "toggleterm")

if not present then return end

toggleterm.setup {
  direction = 'float',
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',-- curved
    winblend = 3,
  },
}
