return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = {
		"Neotree",
	},
	branch = "v3.x",
	dependencies = {
		{
			"3rd/image.nvim",
			opts = {
				backend = "kitty",
				max_width = 100,
				max_height = 100,
				max_width_window_percentage = 100,
				max_height_window_percentage = 100,
				kitty_method = "normal",
			},
			init = function()
				package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
				package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
			end,
		},
	},
	opts = {
		window = {
			mappings = {
				["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
				["e"] = function()
					vim.api.nvim_exec("Neotree focus filesystem left", true)
				end,
				["b"] = function()
					vim.api.nvim_exec("Neotree focus buffers left", true)
				end,
			},
		},
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
			window = {
				mappings = {
					["o"] = "system_open",
				},
			},
			commands = {
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.fn.jobstart({ "open", path }, { detach = true })
				end,
			},
		},
		sources = { "filesystem", "buffers"},
		open_files_do_not_replace_types = { "terminal", "qf"},
		default_component_configs = {
			indent = {
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},
	},
	init = function()
		if vim.fn.argc(-1) == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	keys = {
		{"<leader>e", "<cmd>Neotree<cr>", desc = "Open Neotree"}
	}
}
