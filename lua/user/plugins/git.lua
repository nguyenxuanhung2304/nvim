return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = {
					hl = "GitSignsChange",
					text = "│",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				topdelete = {
					hl = "GitSignsDelete",
					text = "‾",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "~",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			yadm = {
				enable = false,
			},
		},
		event = "BufRead",
	},
	{
		"tpope/vim-fugitive",
    cmd = { "G", "Gtabedit" }
	},
	{
		"f-person/git-blame.nvim",
		init = function()
			vim.g.gitblame_message_template = "<author> • <date> • <summary>"
			vim.g.gitblame_date_format = "%x"
			vim.g.gitblame_message_when_not_committed = "Oh please, commit this !"
		end,
		event = "BufRead",
	},
	{
		"akinsho/git-conflict.nvim",
		event = "InsertEnter",
		opts = function()
			vim.cmd([[
        hi GitconflictCurrent guibg=#307365 ctermbg=4 guifg=#ffffff
        hi GitconflictIncoming guibg=#2F628D ctermbg=4 guifg=#ffffff
      ]])

			return {
				default_mappings = true, -- disable buffer local mapping created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
				highlights = { -- They must have background color, otherwise the default color will be used
					incoming = "GitconflictIncoming",
					current = "GitconflictCurrent",
				},
			}
		end,
	},
  {
    "kdheepak/lazygit.nvim"
  }
}
