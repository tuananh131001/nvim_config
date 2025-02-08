return {
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    event = { { event = "BufReadCmd", pattern = "octo://*" } },
    opts = {
      enable_builtin = true,
      default_to_projects_v2 = true,
      default_merge_method = "squash",
      picker = "fzf-lua",
    },
    keys = {
      { "<leader>opc", "<cmd>Octo pr create draft<CR>", desc = "Create pr in draft(Octo)" },
      { "<leader>opC", "<cmd>Octo pr create<CR>",       desc = "Create pr (Octo)" },
      { "<leader>opb", "<cmd>Octo pr browser<CR>",      desc = "Open PR in Browser(Octo)" },
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
      "echasnovski/mini.pick",
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
    main = "render-markdown",
    opts = {},
    name = "render-markdown",                                                          -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you use the mini.nvim suite
  },
  -- {
  -- 	"tuananh131001/sircutedog",
  -- 	config = function()
  -- 		require("standup").start_reminder(3600) -- Start the reminder (default 1 hour)
  -- 	end,
  -- },
}
-- 	config = function()
-- 		require("octo").setup({
-- 			enable_builtin = true,
-- 			picker = "fzf-lua",
-- 			picker_config = {
-- 			},
-- 				use_emojis = true,
-- 			default_to_projects_v2 = true,
-- 		})
-- 		vim.keymap.set("n", "<leader>ops", ":Octo pr search <CR>", { desc = "Octo PR search" })
-- 		vim.keymap.set("n", "<leader>opl", ":Octo pr list <CR>", { desc = "Octo PR list" })
-- 		vim.keymap.set("n", "<leader>opc", ":Octo pr create <CR>", { desc = "Octo PR create" })
-- 		vim.keymap.set("n", "<leader>opb", ":Octo pr browser <CR>", { desc = "Octo PR browser" })
--
-- 		vim.keymap.set(
-- 			"n",
-- 			"<leader>otr",
-- 			":Octo thread resolve <CR>",
-- 			{ desc = "Mark a review thread as resolved" }
-- 		)
-- 		vim.keymap.set(
-- 			"n",
-- 			"<leader>otu",
-- 			":Octo thread unresolve <CR>",
-- 			{ desc = "Mark a review thread as unresolved" }
-- 		)
-- 		vim.keymap.set("n", "<leader>opr", ":Octo pr ready <CR>", { desc = "Mark a draft PR as ready for review" })
-- 		vim.keymap.set("n", "<leader>opd", ":Octo pr draft <CR>", { desc = "Send a ready PR back to draft" })
-- 	end,
-- },
-- }
