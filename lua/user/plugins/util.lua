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
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter" },
		branch = "v0.6", --recomended as each new version will have breaking changes
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
		event = "BufReadPre",
		opts = {
			filetypes = {
				"html",
				"css",
				"vue",
				"sass",
				"scss",
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
		event = "BufReadPre",
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
	{
		"echasnovski/mini.nvim",
		version = false,
		opts = {
			-- Draw options
			draw = {
				-- Delay (in ms) between event and start of drawing scope indicator
				delay = 100,

				-- Animation rule for scope's first drawing. A function which, given
				-- next and total step numbers, returns wait time (in ms). See
				-- |MiniIndentscope.gen_animation| for builtin options. To disable
				-- animation, use `require('mini.indentscope').gen_animation.none()`.
				-- animation = --<function: implements constant 20ms between steps>,

				-- Symbol priority. Increase to display on top of more symbols.
				priority = 2,
			},

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Textobjects
				object_scope = "ii",
				object_scope_with_border = "ai",

				-- Motions (jump to respective border line; if not present - body line)
				goto_top = "[i",
				goto_bottom = "]i",
			},

			-- Options which control scope computation
			options = {
				-- Type of scope's border: which line(s) with smaller indent to
				-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
				border = "both",

				-- Whether to use cursor column when computing reference indent.
				-- Useful to see incremental scopes with horizontal cursor movements.
				indent_at_cursor = true,

				-- Whether to first check input line to be a border of adjacent scope.
				-- Use it if you want to place cursor on function header to get scope of
				-- its body.
				try_as_border = false,
			},

			-- Which character to use for drawing scope indicator
			symbol = "╎",
		},
		config = function(opts)
			require("mini.indentscope").setup(opts)
		end,
	},
}
