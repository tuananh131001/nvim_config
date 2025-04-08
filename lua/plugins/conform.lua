return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "Format Injected Langs",
			},
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
          javascript = { "eslint_d" },
          typescript = { "eslint_d" },
          ruby = { "rubocop" },
				},
			})
		end,
	},
}
