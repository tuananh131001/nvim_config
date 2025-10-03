return {
	{
		"zbirenbaum/copilot.lua",
		requires = {
			"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
			init = function()
				vim.g.copilot_nes_debounce = 500
			end,
		},
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<C-l>",
						accept_word = false,
						accept_line = false,
						next = "<C-j>",
						prev = "<C-k>",
						dismiss = "<C-h>",
					},
				},
				server_opts_overrides = {
					settings = {
						advanced = {
							listCount = 10,
							inlineSuggestCount = 5,
						},
					},
				},
			})
		end,
	},
}
