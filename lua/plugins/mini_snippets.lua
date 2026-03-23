return {
	{ "rafamadriz/friendly-snippets", lazy = true },
	{
		"nvim-mini/mini.snippets",
		version = "*",
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local snippets = require("mini.snippets")
			snippets.setup({
				snippets = { snippets.gen_loader.from_lang() },
			})
		end,
	},
}
