return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
			require("mini.statusline").setup()
			require("mini.pairs").setup()
      require("mini.tabline").setup()
      require("mini.ai").setup()
      require("mini.pick").setup({ search = { enabled = true } })
      require("mini.bracketed").setup()
      require("mini.splitjoin").setup({
        mappings = {
          join = '<leader>sj',
        }
      })
    end,
  }
}
