local is_inside_git_repo = function()
	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
	return vim.fn.isdirectory(git_dir) ~= 0
end

return {
	{
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
	},
	{
		"mrjones2014/legendary.nvim",
		cond = not vim.g.vscode,
		priority = 10000,
		event = "VeryLazy",
		dependencies = { "kkharji/sqlite.lua" },
		keys = {
			{ "<c-p>", "<cmd>Legendary<cr>", mode = { "n", "v" } },
		},
		opts = {
			extensions = {
				lazy_nvim = true,
			},
			commands = {
				{
					":FormatFile",
					function()
						require("conform").format()
					end,
					desc = "Format file",
				},
				{
					":CopyFileName",
					function()
						vim.cmd("let @+ = expand('%')")
						vim.notify("Copied file name to clipboard")
					end,
					desc = "CopyFileName",
				},
				{
					":CopyAbsoluteFilePath",
					function()
						vim.cmd("let @+ = expand('%:p')")
						vim.notify("Copied ABSOLUTE file path to clipboard")
					end,
					desc = "CopyAbsoluteFilePath",
				},
				{
					":CopyRelativePathWithCurrentLine",
					function()
						local path = vim.fn.expand("%:p:.")
						local current_line = vim.fn.line(".")

						vim.fn.setreg("+", path .. ":" .. current_line)
						vim.notify("Copied RELATIVE file path with current LINE to clipboard")
					end,
					desc = "CopyRelativePathWithCurrentLine",
				},
				{
					":CopyRelativeFilePath",
					function()
						vim.cmd("let @+ = expand('%:p:.')")
						vim.notify("Copied RELATIVE file path to clipboard")
					end,
					desc = "CopyRelativeFilePath",
				},
				{
					":Rspec",
					function()
						local path = vim.fn.expand("%:p:.")
						local current_line = vim.fn.line(".")

						vim.fn.setreg("+", "bundle exec rspec " .. path .. ":" .. current_line)
						vim.notify("Copied RSPEC")
					end,
					desc = "CopyRelativePathWithCurrentLine",
				},
			},
		},
	},
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua", -- optional
		},
    -- stylua: ignore
    keys = {
      { "<leader>gv", function() require('neogit').open({ kind = "vsplit" }) end,    desc = "Open NeoGit in Vertical" },
      { "<leader>gh", function() require('neogit').open({ kind = "split_below" }) end, desc = "Open NeoGit in Horizontal" },
    },
	},
	{
		"vim-test/vim-test",
		event = "VeryLazy",
		dependencies = {
			"preservim/vimux",
		},
		config = function()
			vim.keymap.set("n", "<leader>rc", ":TestNearest<CR>", {})
			vim.keymap.set("n", "<leader>rf", ":TestFile<CR>", {})
			vim.keymap.set("n", "<leader>rs", ":TestSuite<CR>", {})
			vim.keymap.set("n", "<leader>rl", ":TestLast<CR>", {})
			vim.keymap.set("n", "<leader>rv", ":TestVisit<CR>", {})
			vim.cmd("let test#strategy = 'vimux'")
			vim.cmd("let test#ruby#rspec#executable = 'bundle exec rspec'")
		end,
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		event = "VeryLazy",
		main = "render-markdown",
		opts = {},
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you use the mini.nvim suite
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen" },
		keys = {
			{
				"<leader>dvo",
				"<cmd>DiffviewOpen<CR>",
				desc = "Diffview open merge tool",
			},
		},
		config = function()
			local actions = require("diffview.actions")
			require("diffview").setup({
				view = {
					default = {
						layout = "diff2_horizontal",
					},
					file_history = {
						layout = "diff2_horizontal",
					},
					diff_view = {
						layout = "diff2_horizontal",
					},
					merge_tool = {
						layout = "diff1_plain",
					},
				},

				keymaps = {
					view = {
						{
							"n",
							"<leader>do",
							actions.conflict_choose("ours"),
							{ desc = "Choose the OURS version of a conflict" },
						},
						{
							"n",
							"<leader>dt",
							actions.conflict_choose("theirs"),
							{ desc = "Choose the THEIRS version of a conflict" },
						},
						{
							"n",
							"<leader>db",
							actions.conflict_choose("base"),
							{ desc = "Choose the BASE version of a conflict" },
						},
						{
							"n",
							"<leader>da",
							actions.conflict_choose("all"),
							{ desc = "Choose all the versions of a conflict" },
						},
						{
							"n",
							"<leader>dO",
							actions.conflict_choose_all("ours"),
							{ desc = "Choose the OURS version of a conflict for the whole file" },
						},
						{
							"n",
							"<leader>dT",
							actions.conflict_choose_all("theirs"),
							{ desc = "Choose the THEIRS version of a conflict for the whole file" },
						},
						{
							"n",
							"<leader>dB",
							actions.conflict_choose_all("base"),
							{ desc = "Choose the BASE version of a conflict for the whole file" },
						},
						{
							"n",
							"<leader>dA",
							actions.conflict_choose_all("all"),
							{ desc = "Choose all the versions of a conflict for the whole file" },
						},
					},
				},
			})
		end,
	},
	{
		"leath-dub/snipe.nvim",
		keys = {
			{
				"<leader>h",
				function()
					require("snipe").open_buffer_menu()
				end,
				desc = "Open Snipe buffer menu",
			},
		},
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}
