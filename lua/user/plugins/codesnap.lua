return {
	"mistricky/codesnap.nvim",
	build = "make",
  cmd = {
    "CodeSnapSave",
    "CodeSnap"
  },
  opts = {
    save_path = "~/Desktop",
    has_breadcrumbs = true,
    bg_color = "#535c68"
  }
}
