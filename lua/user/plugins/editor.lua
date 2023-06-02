return {
	{
		"kyazdani42/nvim-tree.lua",
		opts = function()
			vim.g.loaded = 1
			vim.g.loaded_netrwPlugin = 1

			return {
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true,
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
								-- arrow_open = " ",
								-- arrow_closed = "",
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
				{
					sync_root_with_cwd = true,
					respect_buf_cwd = true,
					update_focused_file = {
						enable = true,
						update_root = true,
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
									-- arrow_open = " ",
									-- arrow_closed = "",
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
			}
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		cmd = "Telescope",
		opts = {
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		},
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		event = "BufRead",
	},

	{
		"famiu/bufdelete.nvim",
		event = "BufRead",
	},

	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
		event = "BufRead",
	},

	{
		"mhartington/formatter.nvim",
		event = "BufRead",
		opts = function()
			local languages = require("formatter.filetypes")

			return {
				-- Enable or disable logging
				logging = true,
				-- Set the log level
				log_level = vim.log.levels.WARN,
				-- All formatter configurations are opt-in
				filetype = {
					-- Formatter configurations for filetype "lua" go here
					-- and will be executed in order
					lua = {
						languages.lua.stylua,
					},

					ruby = {
						languages.ruby.rubocop,
					},

					eruby = {
						languages.html.prettier,
					},

					html = {
						languages.html.prettier,
					},

					javascript = {
						languages.javascript.prettier,
					},

					-- Use the special "*" filetype for defining formatter configurations on
					-- any filetype
					["*"] = {
						-- "formatter.filetypes.any" defines default configurations for any
						-- filetype
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			}
		end,
	},

	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		opts = {
			---Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = "gcc",
				---Block-comment toggle keymap
				block = "gbc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "gc",
				---Block-comment keymap
				block = "gb",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "gcO",
				---Add comment on the line below
				below = "gco",
				---Add comment at the end of line
				eol = "gcA",
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
				---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
				extended = false,
			},
			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		},
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			shade_terminals = false,
			direction = "float",
		},
	},
	{
		"roobert/search-replace.nvim",
		opts = {
			default_replace_single_buffer_options = "gcI",
			default_replace_multi_buffer_options = "egcI",
		},
	},
	{
		"mrjones2014/legendary.nvim",
		requires = {
			"kkharji/sqlite.lua",
		},
		opts = {

			keymaps = {
				-- Telescope
				{ "<leader>ff", ":Telescope find_files", description = "Files" },
				{ "<cmd>Telescope buffers<cr>", description = "Buffers" },
				{ "<cmd>Telescope colorscheme<cr>", description = "Colorschemes" },
				{ "<cmd>Telescope oldfiles<cr>", description = "Recent files" },
				{ "<cmd>Telescope git_branches<cr>", description = "Git: branches" },
				{ "<cmd>Telescope git_status<cr>", description = "Git: files changed" },
				{ "<cmd>Telescope git_commits<cr>", description = "Git: Commits" },
				{ "<cmd>Telescope git_stash<cr>", description = "Git: Stash" },

				-- Buffer
				{ "<cmd>Bdelete!<CR>", description = "Buffer: Close current" },
				{ "<cmd>BufferLineCloseLeft<CR>", description = "Buffer: Close left" },
				{ "<cmd>BufferLineCloseRight<CR>", description = "Buffer: Close right" },

				{ "<cmd>nohlsearch<CR>", description = "No Highlight" },

				{ "<cmd>Gtabedit:<cr>", description = "Open fugitive in new tab" },

				{ "<cmd>Lazy<cr>", description = "Open plugin manager" },

				{ "<cmd>Format<cr>", description = "Format" },

				-- GitConflict
				{ "<cmd>GitConflictChooseOurs<cr>", description = "GitConflict: Select current" },
				{ "<cmd>GitConflictChooseTheirs<cr>", description = "GitConflict: Select incomming" },
				{ "<cmd>GitConflictChooseBoth<cr>", description = "GitConflict: Select both" },
				{ "<cmd>GitConflictChooseNone<cr>", description = "Select none of the changes" },
				{ "<cmd>GitConflictNextConflict<cr>", description = "GitConflict: Next" },
				{ "<cmd>GitConflictPrevConflict<cr>", description = "GitConflict: Previous" },
				{ "<cmd>GitConflictListQf<cr>", description = "GitConflict: Send to qf" },

				-- GitSign
				{ "<cmd>Gitsigns preview_hunk<cr>", description = "GitSigns: Preview" },
				{ "<cmd>Gitsigns stage_hunk<cr>", description = "GitSigns: Stage" },
				{ "<cmd>Gitsigns reset_hunk<cr>", description = "GitSigns: Unstage" },

				-- Search and repalce
				{ "<cmd>SearchReplaceSingleBufferCWord<cr>", description = "Replace: In file" },
				{ "<cmd>SearchReplaceMultiBufferCWord<cr>", description = "Replace: In project" },
			},
		},
	},
	{
    "akinsho/flutter-tools.nvim",
    opts = {}
  },
}
