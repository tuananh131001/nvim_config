return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.statusline").setup()
			require("mini.diff").setup()
			require("mini.pairs").setup()
			require("mini.tabline").setup()
			require("mini.ai").setup()
			require("mini.pick").setup({
				search = { enabled = true },
				mappings = {
					move_down = "<C-j>",
					move_up = "<C-k>",
					move_start = "<C-g>",
					mark = "<C-x>",
					mark_all = "<C-a>",
					toggle_preview = "<C-p>",
					toggle_info = "<C-i>",
					scroll_down = "<C-d>",
					scroll_up = "<C-u>",
					scroll_left = "<C-h>",
					scroll_right = "<C-l>",
					paste = "<C-r>",
				},
				window = {
					config = function()
						local height = math.floor(0.8 * vim.o.lines)
						local width = math.floor(0.8 * vim.o.columns)
						return {
							anchor = "NW",
							height = height,
							width = width,
							row = math.floor(0.1 * vim.o.lines),
							col = math.floor(0.1 * vim.o.columns),
						}
					end,
				},
			})
			require("mini.bracketed").setup()
			require("mini.splitjoin").setup({
				mappings = {
					join = "<leader>sj",
				},
			})
			require("mini.surround").setup()
			-- LSP -- Completion and Snippets
			vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]]) -- fix snacks issue
			require("mini.icons").setup()
			require("mini.snippets").setup()
			require("mini.completion").setup()

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
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			})
			require("mini.align").setup()

      require("mini.indentscope").setup()
		end,
	},
}
