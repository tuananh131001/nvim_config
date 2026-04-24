return {
	{
		"nvim-mini/mini.clue",
		version = "*",
    event = "VeryLazy",
		config = function()
			--Which-key
			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},

				clues = {
					-- Leader group descriptions
					{ mode = "n", keys = "<Leader>a", desc = "+AI / Sidekick" },
					{ mode = "n", keys = "<Leader>b", desc = "+Blame" },
					{ mode = "n", keys = "<Leader>c", desc = "+Code / LSP" },
					{ mode = "x", keys = "<Leader>c", desc = "+Code / LSP" },
					{ mode = "n", keys = "<Leader>d", desc = "+Diagnostics / Diffview" },
					{ mode = "n", keys = "<Leader>dv", desc = "+Diffview open" },
					{ mode = "n", keys = "<Leader>f", desc = "+Find (files/buffers)" },
					{ mode = "n", keys = "<Leader>g", desc = "+Git" },
					{ mode = "x", keys = "<Leader>g", desc = "+Git" },
					{ mode = "n", keys = "<Leader>i", desc = "+Inlay hints" },
					{ mode = "n", keys = "<Leader>m", desc = "+Markview" },
					{ mode = "n", keys = "<Leader>o", desc = "+Octo" },
					{ mode = "n", keys = "<Leader>op", desc = "+Octo PR" },
					{ mode = "n", keys = "<Leader>r", desc = "+Run tests / Rename" },
					{ mode = "n", keys = "<Leader>s", desc = "+Search / Symbols / Split" },
					{ mode = "n", keys = "<Leader>x", desc = "+Trouble / Diagnostics list" },
					{ mode = "n", keys = "<Leader><Tab>", desc = "+Tab" },

					-- Built-in groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			})
		end,
	},
}
