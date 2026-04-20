return {
	{
		"nvim-mini/mini.nvim",
		version = "*",
		config = function()
			require("mini.diff").setup()
			require("mini.pairs").setup()
			require("mini.tabline").setup()
			require("mini.ai").setup()
			require("mini.bracketed").setup()
			require("mini.splitjoin").setup({
				mappings = {
					join = "<leader>sj",
				},
			})
			require("mini.icons").setup()
			require("mini.align").setup()
      require("mini.operators").setup()
		end,
	},
}
