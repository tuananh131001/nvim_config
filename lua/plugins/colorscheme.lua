return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	-- opts = { style = "night" },
	-- 	config = function(_, opts)
	-- 		require("tokyonight").setup(opts)
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 		-- vim.cmd([[...]])
	-- 	end,
	-- },
	{
		"tuananh131001/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("monokai-pro").setup()
			vim.cmd.colorscheme("monokai-pro")
		end,
	},
}
