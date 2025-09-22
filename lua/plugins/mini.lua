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

		end,
	},
}
