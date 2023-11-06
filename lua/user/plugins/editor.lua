return {
	{
		"kyazdani42/nvim-tree.lua",
		cmd = {
			"NvimTreeToggle"
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
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		cmd = "Telescope",
		dependencies = {
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-frecency.nvim",
		},
		opts = {
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					media_files = {
						filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
						find_cmd = "rg",
					},
				},
			})
			require("telescope").load_extension("media_files")
			require("telescope").load_extension("frecency")
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		event = "BufReadPre",
	},

	{
		"famiu/bufdelete.nvim",
		event = "BufReadPre",
	},

	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
		event = "BufReadPre",
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

					dart = {
						languages.dart.dartformat,
					},

					vue = {
						languages.vue.prettier,
					},

					css = {
						languages.css.prettier,
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
		ft = "dart",
		opts = {
			lsp = {
				settings = {
					analysisExcludedFolders = { "vim.fn.expand('$HOME/flutter/.pub-cache')" },
				},
			},
		},
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
				["<leader>D"] = { name = "+Diff" },
			},
			window = {
				border = "single",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
	{
		"gennaro-tedesco/nvim-peekup",
		event = "BufReadPre",
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = {
			"MarkdownPreview",
		},
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = {
			"ToggleTerm"
		},
		keys = "<C-\\>",
		version = "*",
		config = true,
		opts = {
			direction = "float",
			 open_mapping = [[<c-\>]],
		}
	},
	{
		'nvim-pack/nvim-spectre',
		lazy = true
	}
}
