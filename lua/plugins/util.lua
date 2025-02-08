return {
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
    event = "VeryLazy",
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
    keys = {
			{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Create new Obsidian note" },
			{ "<leader>ot", "<cmd>ObsidianToday<CR>", desc = "Create new Obsidian today" },
			{ "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", desc = "Search Obsidian Note" },
			{ "<leader>osp", "<cmd>ObsidianSearch<CR>", desc = "Search Obsidian Note String Buffer" },
    },
     picker = {
      name = "fzf-lua",
    },
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Documents/Resources/Excalidraw",
				}
			},

			-- see below for full list of options 👇
      ui = {
        enable = false
      }
		},
	},
}
