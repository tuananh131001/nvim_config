return {
	{
		"MeanderingProgrammer/markdown.nvim",
		event = "VeryLazy",
		main = "render-markdown",
		opts = { file_types = { "markdown", "Avante" } },
		ft = { "markdown", "Avante" },
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you use the mini.nvim suite
		keys = {
      { "<leader>mt", function() require('render-markdown').toggle() end,    desc = "Toggle Render Markdown" },
    },
    config = function()
      require("render-markdown").setup({
        completions = { lsp = { enabled = true } },
      })
    end,

	},
}
