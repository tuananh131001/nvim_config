return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		build = "make",
		opts = {
      provider = "gemini",
			providers = {
				gemini = {
					endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
					model = "gemini-2.0-flash",
					timeout = 30000, -- Timeout in milliseconds
					use_ReAct_prompt = true,
					extra_request_body = {
						generationConfig = {
							temperature = 0.75,
						},
					},
				},
			},
			file_selector = {
				provider = "snacks",
				provider_opts = {},
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
}
