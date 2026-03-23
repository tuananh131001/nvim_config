return {
	{
		"echasnovski/mini.completion",
		version = "*",
		event = "InsertEnter",
		config = function()
			vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]])
			require("mini.completion").setup({
				lsp_completion = {
					source_func = "omnifunc",
				},
			})
		end,
	},
}
