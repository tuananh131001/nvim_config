return {
	{
		"NeogitOrg/neogit",
		-- dir = "/Users/anh.nt/Documents/coding/personal/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
		},
    -- stylua: ignore
    keys = {
      { "<leader>gv", function() require('neogit').open({ kind = "vsplit" }) end,    desc = "Open NeoGit in Vertical" },
      { "<leader>gh", function() require('neogit').open({ kind = "split_below" }) end, desc = "Open NeoGit in Horizontal" },
    },
	},
}
