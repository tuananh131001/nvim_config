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
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {},
			},
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      }
		},
	},
}
