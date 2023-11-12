return {
	{
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
		"stevearc/oil.nvim",
		opts = {},
		cmd = "Oil"
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
				["<leader>G"] = {
					name = "ChatGPT",
					c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
					e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
					g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
					t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
					k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
					d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
					a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
					o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
					s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
					f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
					x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
					r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
					l = {
						"<cmd>ChatGPTRun code_readability_analysis<CR>",
						"Code Readability Analysis",
						mode = { "n", "v" },
					},
				},
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
			"ToggleTerm",
		},
		keys = "<C-\\>",
		version = "*",
		config = true,
		opts = {
			direction = "float",
			open_mapping = [[<c-\>]],
		},
	},
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
	},
	{
		"jackMort/ChatGPT.nvim",
		-- event = "VeryLazy",
		cmd = {
			"ChatGPT",
			"ChatGPTActAs",
			"ChatGPTEditWithInstructions",
			"ChatGPTRun",
		},
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
