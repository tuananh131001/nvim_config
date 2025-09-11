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

			-- Set up Mini.pick keymaps (migrated from Snacks)
			local MiniPick = require("mini.pick")

			-- File pickers
			vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "Buffers" })
			vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fr", function()
				MiniPick.builtin.files({ recency_weight = 1 })
			end, { desc = "Recent" })
			vim.keymap.set("n", "<leader>fR", function()
				MiniPick.builtin.files({ recency_weight = 1, tool = "git" })
			end, { desc = "Recent (cwd)" })

			-- Grep
			vim.keymap.set("n", "<leader>sg", MiniPick.builtin.grep_live, { desc = "Grep" })

			-- LSP
			vim.keymap.set("n", "gd", function()
				MiniPick.builtin.lsp({ scope = "definition" })
			end, { desc = "Goto Definition" })
			vim.keymap.set("n", "gD", function()
				MiniPick.builtin.lsp({ scope = "declaration" })
			end, { desc = "Goto Declaration" })
			vim.keymap.set("n", "gr", function()
				MiniPick.builtin.lsp({ scope = "references" })
			end, { nowait = true, desc = "References" })
			vim.keymap.set("n", "gI", function()
				MiniPick.builtin.lsp({ scope = "implementation" })
			end, { desc = "Goto Implementation" })
			vim.keymap.set("n", "gy", function()
				MiniPick.builtin.lsp({ scope = "type_definition" })
			end, { desc = "Goto T[y]pe Definition" })
			vim.keymap.set("n", "<leader>ss", function()
				MiniPick.builtin.lsp({ scope = "document_symbol" })
			end, { desc = "LSP Symbols" })
			vim.keymap.set("n", "<leader>sS", function()
				MiniPick.builtin.lsp({ scope = "workspace_symbol" })
			end, { desc = "LSP Workspace Symbols" })
		end,
	},
}
