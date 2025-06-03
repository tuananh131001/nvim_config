return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					header = [[
████████ ██    ██  █████  ███    ██      █████  ███    ██ ██   ██ 
   ██    ██    ██ ██   ██ ████   ██     ██   ██ ████   ██ ██   ██ 
   ██    ██    ██ ███████ ██ ██  ██     ███████ ██ ██  ██ ███████ 
   ██    ██    ██ ██   ██ ██  ██ ██     ██   ██ ██  ██ ██ ██   ██ 
   ██     ██████  ██   ██ ██   ████     ██   ██ ██   ████ ██   ██ 
                                                                  
                                                                  
        ]],
				},
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ section = "startup" },
				},
			},
			explorer = { enabled = false },
			indent = { enabled = true },
			picker = { enabled = true, 			exclude = { -- add folder names here to exclude
				".git",
				"node_modules",
			}, },
      notify = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			input = { enabled = true },
		},
    -- stylua: ignore
    keys = {
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
      { "<leader>fR", function() Snacks.picker.recent({ filter = { cwd = true }}) end, desc = "Recent (cwd)" },
      -- Grep
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    },
	},
}
