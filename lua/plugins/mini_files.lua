return {
	{
		"nvim-mini/mini.files",
		version = "*",
		opts = {
			mappings = {
				go_in = "L",
				go_in_plus = "<CR>",
				go_out = "H",
				go_out_plus = "-",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_common = "c",
			},
		},
		keys = {
			{
				"-",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open mini.files (Directory of Current File)",
			},
			{
				"<leader>fM",
				function()
					require("mini.files").open(vim.uv.cwd(), true)
				end,
				desc = "Open mini.files (cwd)",
			},
		},
	},
}
