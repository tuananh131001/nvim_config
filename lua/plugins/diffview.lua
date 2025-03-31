return {

	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen" },
		keys = {
			{
				"<leader>dvo",
				"<cmd>DiffviewOpen<CR>",
				desc = "Diffview open merge tool",
			},
		},
		config = function()
			local actions = require("diffview.actions")
			require("diffview").setup({
				view = {
					default = {
						layout = "diff2_horizontal",
					},
					file_history = {
						layout = "diff2_horizontal",
					},
					diff_view = {
						layout = "diff2_horizontal",
					},
					merge_tool = {
						layout = "diff1_plain",
					},
				},

				keymaps = {
					view = {
						{
							"n",
							"<leader>do",
							actions.conflict_choose("ours"),
							{ desc = "Choose the OURS version of a conflict" },
						},
						{
							"n",
							"<leader>dt",
							actions.conflict_choose("theirs"),
							{ desc = "Choose the THEIRS version of a conflict" },
						},
						{
							"n",
							"<leader>db",
							actions.conflict_choose("base"),
							{ desc = "Choose the BASE version of a conflict" },
						},
						{
							"n",
							"<leader>da",
							actions.conflict_choose("all"),
							{ desc = "Choose all the versions of a conflict" },
						},
						{
							"n",
							"<leader>dO",
							actions.conflict_choose_all("ours"),
							{ desc = "Choose the OURS version of a conflict for the whole file" },
						},
						{
							"n",
							"<leader>dT",
							actions.conflict_choose_all("theirs"),
							{ desc = "Choose the THEIRS version of a conflict for the whole file" },
						},
						{
							"n",
							"<leader>dB",
							actions.conflict_choose_all("base"),
							{ desc = "Choose the BASE version of a conflict for the whole file" },
						},
						{
							"n",
							"<leader>dA",
							actions.conflict_choose_all("all"),
							{ desc = "Choose all the versions of a conflict for the whole file" },
						},
					},
				},
			})
		end,
	},
}
