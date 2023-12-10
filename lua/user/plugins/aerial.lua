return {
	"stevearc/aerial.nvim",
	event = "LspAttach",
	config = function()
		require("aerial").setup({
			on_attach = function(bufnr)
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>", { desc = "Toggle Aerial" })
			end,
		})
	end,
}
