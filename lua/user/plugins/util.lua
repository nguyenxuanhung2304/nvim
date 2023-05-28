return {
	{ "nvim-lua/plenary.nvim" },
	{ "lewis6991/impatient.nvim" },
	{
		"mattn/emmet-vim",
		event = "BufRead",
		init = function()
			vim.cmd([[
        " let g:user_emmet_expandabbr_key = '<Tab>'
        " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
      ]])
		end,
	},
	{
		"tpope/vim-rails",
		event = {
			"InsertEnter",
		},
	},
	{
		"Pocco81/auto-save.nvim",
		event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "BufRead",
		opts = {},
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = "BufRead",
	},
	{
		"kevinhwang91/nvim-hlslens",
		opts = {},
	},
}
