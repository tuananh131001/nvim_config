return {
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	name = "github-theme",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		require("github-theme").setup({
	-- 			-- ...
	-- 		})
	--
	-- 		vim.cmd("colorscheme github_dark_colorblind")
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("nightfox").setup({
	-- 			options = {
	-- 				colorblind = {
	-- 					enable = true,
	-- 					severity = {
	-- 						protan = 0,
	--              tritan = 0,
	--              deutan = 0,
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme carbonfox")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			integrations = {
	-- 				mason = true,
	-- 				diffview = true,
	-- 				aerial = true,
	-- 				octo = true,
	-- 				lsp_trouble = true,
	-- 				nvim_surround = true,
	-- 				which_key = true,
	-- 				grug_far = true,
	-- 				blink_cmp = true,
	-- 				snacks = {
	-- 					enabled = true,
	-- 					indent_scope_color = "catppuccin-mocha",
	-- 				},
	-- 			},
	-- 		})
	-- 		-- vim.cmd.colorscheme("catppuccin-mocha")
	-- 	end,
	-- },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		-- opts = { style = "night" },
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
			-- vim.cmd([[...]])
		end,
	},
	-- {
	-- 	"nvim-mini/mini.base16",
	-- 	version = "*",
	-- 	config = function()
	-- 		local github_hub = require("mini.base16").mini_palette("#0d1117", "#c9d1d9", 75)
	-- 		require("mini.base16").setup({
	-- 			palette = github_hub,
	-- 			use_cterm = true,
	-- 			plugins = {
	-- 				default = true,
	-- 				["nvim-mini/mini.nvim"] = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
