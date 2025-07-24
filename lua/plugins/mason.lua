return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = {
					"phpcs",
					"php-cs-fixer",
				},
			})
		end,
	},
}
