return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
    build = "make",
		opts = {
			-- add any opts here
			-- for example
			provider = "gemini",
			gemini = {
				endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
				model = "gemini-2.0-flash",
				timeout = 30000, -- Timeout in milliseconds
				temperature = 0,
				max_tokens = 8192,
			},
       file_selector = {
        --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
        provider = "snacks",
        -- Options override for custom providers
        provider_opts = {},
      }
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
}
