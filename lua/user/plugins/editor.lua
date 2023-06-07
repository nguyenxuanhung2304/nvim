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
		"akinsho/flutter-tools.nvim",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			defaults = {
				mode = { "n", "v" },
				["<leader>s"] = { name = "+Search" },
				["<leader>z"] = { name = "+Fold" },
				["<leader>C"] = { name = "+Conflict" },
				["<leader>;"] = { name = "+Git" },
			},
			window = {
				border = "single",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end
	},
	{
		"gennaro-tedesco/nvim-peekup",
		event = "BufReadPre",
	},
   {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
