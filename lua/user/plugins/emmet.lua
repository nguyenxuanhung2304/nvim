return {
	"mattn/emmet-vim",
	event = "InsertEnter",
	init = function()
		vim.cmd([[
        " let g:user_emmet_expandabbr_key = '<Tab>'
        " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
      ]])
	end,
}
