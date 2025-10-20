return {
	{
		"nvim-mini/mini.completion",
		version = "*",
		event = "VeryLazy",
		config = function()
			-- LSP -- Completion and Snippets
			vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]]) -- fix snacks issue
			require("mini.completion").setup({
				lsp_completion = {
					source_func = "omnifunc", -- Weird character appear when using default value
				},
			})
		end,
	},
}
