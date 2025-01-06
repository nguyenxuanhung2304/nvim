local Utils = require("user.core.utils")
local map = Utils.keymap

return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(_)
				local gs = require("gitsigns")

				-- Navigation
				map("n", "]g", gs.next_hunk, { desc = "Next hunk" })
				map("n", "[g", gs.prev_hunk, { desc = "Prev hunk" })

				-- Actions
				map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
				map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
			end,
		},
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"f-person/git-blame.nvim",
		init = function()
			vim.g.gitblame_ignored_filetypes = { "toggleterm" }
			vim.g.gitblame_message_template = "<author> • <date> • <summary>"
			vim.g.gitblame_date_format = "%x"
			vim.g.gitblame_message_when_not_committed = "Oh please, commit this !"
		end,
		event = "BufRead",
	},
	{
		"akinsho/git-conflict.nvim",
		event = "BufReadPre",
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
		keys = {
			{
				"<Leader>Cc",
				"<cmd>GitConflictChooseOurs<cr>",
				desc = "Select current",
			},
			{ "<Leader>Ci", "<cmd>GitConflictChooseTheirs<cr>", desc = "Select incomming" },
			{ "<Leader>Cb", "<cmd>GitConflictChooseBoth<cr>", desc = "Select both" },
			"<Leader>Cn",
			"<cmd>GitConflictNextConflict<cr>",
			desc = "Next",
			{ "<Leader>Cp", "<cmd>GitConflictPrevConflict<cr>", desc = "Previous" },
		},
	},
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		config = true,
		opts = {
			integrations = {
				telescope = true,
			},
		},
		keys = {
			{ "<Leader>go", "<cmd>Neogit<cr>", desc = "Open neogit" },
		},
	},
}
