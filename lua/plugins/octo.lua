return {
		"pwntester/octo.nvim",
		cmd = "Octo",
		event = { { event = "BufReadCmd", pattern = "octo://*" } },
		opts = {
			enable_builtin = true,
			default_to_projects_v2 = true,
			default_merge_method = "squash",
			picker = "snacks",
		},
		keys = {
			{ "<leader>opc", "<cmd>Octo pr create draft<CR>", desc = "Create pr in draft(Octo)" },
			{ "<leader>opC", "<cmd>Octo pr create<CR>", desc = "Create pr (Octo)" },
			{ "<leader>opb", "<cmd>Octo pr browser<CR>", desc = "Open PR in Browser(Octo)" },
			{ "<leader>opm", "<cmd>Octo pr list tuananh131001<CR>", desc = "List of pr by my name(Octo)" },
		},
	}
