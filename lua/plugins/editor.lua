return {
  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   opts_extend = { "spec" },
  --   opts = {
  --     preset = "helix",
  --     defaults = {},
  --     spec = {
  --       {
  --         mode = { "n", "v" },
  --         { "<leader><tab>", group = "tabs" },
  --         { "<leader>c", group = "code" },
  --         { "<leader>d", group = "debug" },
  --         { "<leader>dp", group = "profiler" },
  --         { "<leader>f", group = "file/find" },
  --         { "<leader>g", group = "git" },
  --         { "<leader>gh", group = "hunks" },
  --         { "<leader>q", group = "quit/session" },
  --         { "<leader>s", group = "search" },
  --         { "<leader>l", group = "lsp" },
  --         { "<leader>r", group = "test" },
  --         { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
  --         { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
  --         { "[", group = "prev" },
  --         { "]", group = "next" },
  --         { "g", group = "goto" },
  --         { "gs", group = "surround" },
  --         { "z", group = "fold" },
  --         {
  --           "<leader>b",
  --           group = "buffer",
  --           expand = function()
  --             return require("which-key.extras").expand.buf()
  --           end,
  --         },
  --         {
  --           "<leader>w",
  --           group = "windows",
  --           proxy = "<c-w>",
  --           expand = function()
  --             return require("which-key.extras").expand.win()
  --           end,
  --         },
  --         -- better descriptions
  --         { "gx", desc = "Open with system app" },
  --       },
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>?",
  --       function()
  --         require("which-key").show({ global = false })
  --       end,
  --       desc = "Buffer Keymaps (which-key)",
  --     },
  --     {
  --       "<c-w><space>",
  --       function()
  --         require("which-key").show({ keys = "<c-w>", loop = true })
  --       end,
  --       desc = "Window Hydra Mode (which-key)",
  --     },
  --   },
  --   config = function(_, opts)
  --     local wk = require("which-key")
  --     wk.setup(opts)
  --     if not vim.tbl_isempty(opts.defaults) then
  --       wk.register(opts.defaults)
  --     end
  --   end,
  -- },
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader>ff",
        "<cmd>lua require('fzf-lua').files()<CR>",
        desc = "Fzf Files",
      },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>",                                 desc = "Recent" },
      { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      {
        "<leader>sp",
        "<cmd>lua require('fzf-lua').live_grep()<CR>",
        desc = "Fzf Search in Directory or Root",
      },
    },
  },
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  -- {
  --   "MagicDuck/grug-far.nvim",
  --   opts = { headerMaxWidth = 80 },
  --   cmd = "GrugFar",
  --   keys = {
  --     {
  --       "<leader>sr",
  --       function()
  --         local grug = require("grug-far")
  --         local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  --         grug.open({
  --           transient = true,
  --           prefills = {
  --             filesFilter = ext and ext ~= "" and "*." .. ext or nil,
  --           },
  --         })
  --       end,
  --       mode = { "n", "v" },
  --       desc = "Search and Replace",
  --     },
  --   },
  -- },
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function(_, opts)
      require("oil").setup(opts)
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end
  },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   ---@type Flash.Config
  --   opts = {},
  --   -- stylua: ignore
  --   keys = {
  --     { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
  --     { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
  --     { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
  --     { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --     { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  --   },
  -- }
}
