return {
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function(_, opts)
			require("oil").setup(opts)
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			local oil = require("oil")
			oil.setup({
				keymaps = {
					-- create a new mapping, gs, to search and replace in the current directory
					gs = {
						callback = function()
							-- get the current directory
							local prefills = { paths = oil.get_current_dir() }

							local grug_far = require("grug-far")
							-- instance check
							if not grug_far.has_instance("explorer") then
								grug_far.open({
									instanceName = "explorer",
									prefills = prefills,
									staticTitle = "Find and Replace from Explorer",
								})
							else
								grug_far.get_instance("explorer"):open()
								-- updating the prefills without clearing the search and other fields
								grug_far.get_instance("explorer"):update_input_values(prefills, false)
							end
						end,
						desc = "oil: Search in directory",
					},
				},
			})
		end,
	},
}
