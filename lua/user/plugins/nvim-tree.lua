return {
	"kyazdani42/nvim-tree.lua",
	cmd = {
		"NvimTreeToggle",
	},
	setup = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		filters = {
			custom = {
				"^.git$",
			},
			dotfiles = false,
		},
		renderer = {
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						deleted = "",
						untracked = "U",
						ignored = "◌",
					},
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
					},
				},
			},
		},
		git = {
			ignore = false,
		},
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
		{ "<leader>.", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in NvimTree" },
	},
}
