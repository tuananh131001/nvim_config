return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					mason = true,
					diffview = true,
					aerial = true,
					octo = true,
					lsp_trouble = true,
					nvim_surround = true,
					which_key = true,
					grug_far = true,
					blink_cmp = true,
					snacks = {
						enabled = true,
						indent_scope_color = "catppuccin-mocha",
					},
				},
			})
			-- vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"nvim-mini/mini.base16",
		version = "*",
		config = function()
			local p = require("mini.base16").mini_palette("#000000", "#dad9c7", 75)
			require("mini.base16").setup({
				palette = p,
				use_cterm = true,
				plugins = {
					default = true,
					["nvim-mini/mini.nvim"] = true,
				},
			})
		end,
	},
}
