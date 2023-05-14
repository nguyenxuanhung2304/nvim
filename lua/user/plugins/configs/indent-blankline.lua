local present, indent_blankline = pcall(require, "indent_blankline")
if not present then
  print("indent_blankline not yet installed!")
	return
end

indent_blankline.setup {
  show_current_context = true,
  show_current_context_start = true,
}

vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
  "alpha"
}
