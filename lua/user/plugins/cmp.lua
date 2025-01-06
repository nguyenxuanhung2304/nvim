return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"xzbdmw/colorful-menu.nvim",
			config = function()
				-- You don't need to set these options.
				require("colorful-menu").setup({
					ls = {
						lua_ls = {
							-- Maybe you want to dim arguments a bit.
							arguments_hl = "@comment",
						},
						gopls = {
							-- When true, label for field and variable will format like "foo: Foo"
							-- instead of go's original syntax "foo Foo".
							add_colon_before_type = false,
						},
						["typescript-language-server"] = {
							extra_info_hl = "@comment",
						},
						["typescript-tools"] = {
							extra_info_hl = "@comment",
						},
						ts_ls = {
							extra_info_hl = "@comment",
						},
						tsserver = {
							extra_info_hl = "@comment",
						},
						vtsls = {
							extra_info_hl = "@comment",
						},
						["rust-analyzer"] = {
							-- Such as (as Iterator), (use std::io).
							extra_info_hl = "@comment",
						},
						clangd = {
							-- Such as "From <stdio.h>".
							extra_info_hl = "@comment",
						},
						roslyn = {
							extra_info_hl = "@comment",
						},

						-- If true, try to highlight "not supported" languages.
						fallback = true,
					},
					-- If the built-in logic fails to find a suitable highlight group,
					-- this highlight is applied to the label.
					fallback_highlight = "@variable",
					-- If provided, the plugin truncates the final displayed text to
					-- this width (measured in display cells). Any highlights that extend
					-- beyond the truncation point are ignored. Default 60.
					max_width = 60,
				})
			end,
		},
	},
	version = "*",
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = { preset = "default" },

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
	config = function()
		require("blink.cmp").setup({
			completion = {
				menu = {
					draw = {
						-- We don't need label_description now because label and label_description are already
						-- conbined together in label by colorful-menu.nvim.
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								text = require("colorful-menu").blink_components_text,
								highlight = require("colorful-menu").blink_components_highlight,
							},
						},
					},
				},
			},
		})
	end,
}
