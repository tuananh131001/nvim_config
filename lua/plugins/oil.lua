return {
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function(_, opts)
      require("oil").setup(opts)
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}
