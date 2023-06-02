return {
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	{
		"goolord/alpha-nvim",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				[[                               __                ]],
				[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
				[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
				[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
				[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
				[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			}
			dashboard.section.buttons.val = {
				dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
				dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
				dashboard.button("t", "  Find text", ":Telescope live_grep<CR>"),
				dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}

			local function footer()
				return "nguyenxuanhung2304"
			end

			dashboard.section.footer.val = footer()

			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.header.opts.hl = "Include"
			dashboard.section.buttons.opts.hl = "Keyword"

			dashboard.opts.opts.noautocmd = true
			return dashboard
		end,
		config = function(_, dashboard)
			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			require("alpha").setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = function()
			vim.g.indent_blankline_filetype_exclude = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"alpha",
			}

			return {
				show_current_context = true,
				show_current_context_start = true,
			}
		end,
	},
	{
		"p00f/nvim-ts-rainbow",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"branch",
						icons_enabled = true,
						icon = "",
					},
				},
				lualine_c = {},
				lualine_x = {
					{
						function()
							local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
							return "Spaces: " .. shiftwidth
						end,
						padding = 1,
					},
					"filetype",
					{
						function()
							if rawget(vim, "lsp") then
								for _, client in ipairs(vim.lsp.get_active_clients()) do
									if client.attached_buffers[vim.api.nvim_get_current_buf()] then
										return string.format(" %s", client.name)
									end
								end
							end
						end,
					},
				},
				lualine_y = {
					{
						"location",
						padding = 0,
					},
				},
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		},
	},
	-- Buffer
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				numbers = "none",
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon",
				},
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				--- name_formatter can be used to change the buffer's label in the bufferline.
				--- Please note some names can/will break the
				--- bufferline so use this at your discretion knowing that it has
				--- some limitations that will *NOT* be fixed.
				name_formatter = function(buf) -- buf contains:
					return buf.name
					-- name                | str        | the basename of the active file
					-- path                | str        | the full path of the active file
					-- bufnr (buffer only) | int        | the number of the active buffer
					-- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
					-- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
				end,
				max_name_length = 35,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 18,
				diagnostics = false,
				diagnostics_update_in_insert = false,
				-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
				diagnostics_indicator = function(count)
					return "(" .. count .. ")"
				end,
				-- NOTE: this will be called a lot so don't do any heavy processing here
				custom_filter = function(buf_number, buf_numbers)
					-- filter out filetypes you don't want to see
					if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
						return true
					end
					-- filter out by buffer name
					if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
						return true
					end
					-- filter out based on arbitrary rules
					-- e.g. filter out vim wiki buffer from tabline in your work repo
					if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
						return true
					end
					-- filter out by it's index number in list (don't show first buffer)
					if buf_numbers[1] ~= buf_number then
						return true
					end
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = function()
							return "File Explorer"
						end,
						text_align = "center",
						separator = true,
						highlight = "Directory",
					},
					{
						filetype = "fugitive",
						text = "Fugitive",
						padding = 1,
					},
				},
				color_icons = true, -- whether or not to add the filetype icon highlights
				show_buffer_icons = true, -- disable filetype icons for buffers
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				-- can also be a table containing 2 custom separators
				-- [focused and unfocused]. eg: { '|', '|' }
				separator_style = "thin",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		event = { "BufEnter" },
		dependencies = { "kevinhwang91/promise-async" },
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
    opts = {}
	},
  {
    'Bekaboo/dropbar.nvim',
    opts = {
      icons = {
        ui = {
          bar = {
            separator = '  '
          }
        }
      },
      menu = {
        win_configs = {
          border = "single"
        }
      }
    }
  }
}
