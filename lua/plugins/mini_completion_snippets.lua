return {
	{
		"nvim-mini/mini.snippets",
		version = "*",
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local snippets = require("mini.snippets")
			snippets.setup({
				snippets = {
					snippets.gen_loader.from_lang({
						lang_patterns = {
							tsx = { "javascript/typescript.json", "javascript/react-ts.json", "html.json" },
							jsx = { "javascript/javascript.json", "javascript/react.json", "html.json" },
						},
					}),
				},
			})
			-- match = false: let mini.completion handle filtering/sorting
			-- Snippet placeholders in completion popup:
			--   • = tab stop ($1, $2) — cursor jump positions
			--   ■ = final tab stop ($0) — where cursor ends
			snippets.start_lsp_server({ match = false })
		end,
	},

	{
		"nvim-mini/mini.completion",
		version = "*",
		event = "InsertEnter",
		config = function()
			vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]])
			require("mini.completion").setup({
				-- lsp_completion = {
				-- 	source_func = "omnifunc",
				-- },
			})
		end,
	},
}
