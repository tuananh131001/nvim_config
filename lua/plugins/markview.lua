return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		-- For `nvim-treesitter` users.
		priority = 49,

		preview = {
			icon_provider = "mini",
		},
		opts = {
			preview = {
				enable = false,
			},
		},
		keys = {
			{
				"<leader>mt",
				"<Cmd>Markview toggle<CR>",
				desc = "toggle markdown preview",
				mode = "n",
				noremap = true,
				silent = true,
			},
		},
		-- For blink.cmp's completion
		-- source
		-- dependencies = {
		--     "saghen/blink.cmp"
		-- },
	},
}
