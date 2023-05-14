local present, legendary = pcall(require, "legendary")
if not present then
  print("legendary not yet installed!")
  return
end

legendary.setup({
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
})
