return {
	{
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
		event = { "InsertEnter", "CmdlineEnter" },
		version = "*",
		opts = {
			keymap = { preset = "default" },
			appearance = {
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
			},
		},
	},
}
