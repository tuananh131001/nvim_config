return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets", "Kaiser-Yang/blink-cmp-avante", { "fang2hou/blink-copilot" } },


	-- use a release tag to download pre-built binaries
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			["<C-y>"] = { "select_and_accept" },
		},
		completion = {
			menu = {
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},

			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
		},
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},

		sources = {
			default = {
        "copilot",
				"avante",
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
			providers = {
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {
						-- options for blink-cmp-avante
					},
				},

        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
			},
		},

		-- experimental signature help support
		signature = { enabled = true },
	},
}
