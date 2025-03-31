return({
	{
		"echasnovski/mini.statusline",
		version = "*",

		config = function()
			require("mini.statusline").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = "*",

		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.tabline",
		version = "*",
		config = function()
			require("mini.tabline").setup({})
		end,
  },
  {
		"echasnovski/mini.ai",
		version = "*",
		config = function()
			require("mini.ai").setup({})
		end,
	},
})
