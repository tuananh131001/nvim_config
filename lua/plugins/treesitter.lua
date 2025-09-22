return {
	{
		"nvim-treesitter/nvim-treesitter",
    lazy = false,
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
    priority = 50,
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				indent = { enable = true },
				highlight = { enable = true, additional_vim_regex_highlighting = false },
				ensure_installed = { "php" },
			})

			vim.treesitter.language.register("markdown", "octo")
		end,
	},
}
