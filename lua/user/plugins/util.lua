return {
	{ "nvim-lua/plenary.nvim" },
	{ "lewis6991/impatient.nvim" },
	{
		"mattn/emmet-vim",
		event = "BufRead",
		init = function()
			vim.cmd([[
        " let g:user_emmet_expandabbr_key = '<Tab>'
        " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
      ]])
		end,
	},
	{
		"tpope/vim-rails",
		event = {
			"BufReadPre",
		},
	},
	{
		"Pocco81/auto-save.nvim",
		event = "BufReadPre",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "BufRead",
		opts = {},
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = "BufRead",
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "BufReadPre",
		opts = {},
	},
	{
		"barrett-ruth/live-server.nvim",
		cmd = { "LiveServerStart" },
		build = "yarn global add live-server",
		config = true,
		opts = {},
	},
	{
		"karb94/neoscroll.nvim",
		opts = {
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
		},
		event = "BufReadPre",
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			filetypes = {
				"html", "css", "vue", "sass", "scss"
			},
			user_default_options = {
				mode = "background",
				tailwind = true,
			},
		},
	},
	{
		"nmac427/guess-indent.nvim",
		event = "BufReadPre",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPre",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{
		"ethanholz/nvim-lastplace",
		event = "BufReadPre",
		opts = {
			lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
			lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
			lastplace_open_folds = true,
		},
	},
	{
		"levouh/tint.nvim",
		opts = {},
	},
	{
		"tzachar/local-highlight.nvim",
		opts = {
			disable_file_types = {
				"log",
			},
		},
	},
}
