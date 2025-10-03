return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.statusline").setup()
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
			-- LSP -- Completion and Snippets
			vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]]) -- fix snacks issue
			require("mini.icons").setup()
			require("mini.snippets").setup()
			require("mini.completion").setup()

			require("mini.align").setup()

      require("mini.indentscope").setup()
      require("mini.operators").setup()
		end,
	},
}
