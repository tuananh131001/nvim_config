return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
		key = {
			{
				"<C-J>",
				function()
					require("copilot.suggestion").next()
				end,
				desc = "Next Copilot suggestion",
			},
			{
				"<C-K>",
				function()
					require("copilot.suggestion").prev()
				end,
				desc = "Previous Copilot suggestion",
			},
			{
				"<C-CR>",
				function()
					require("copilot.suggestion").accept()
				end,
				desc = "Accept Copilot suggestion",
			},
			{
				"<C-E>",
				function()
					require("copilot.suggestion").dismiss()
				end,
				desc = "Dismiss Copilot suggestion",
			},
			{
				"<C-Space>",
				function()
					require("copilot.suggestion").trigger()
				end,
				desc = "Force Copilot suggestion",
			},
		},
	},
}
