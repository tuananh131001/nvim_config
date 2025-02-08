-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- LazyVim utils
local lazyvimpath = vim.fn.stdpath("data") .. "/lazy/LazyVim"
if not vim.uv.fs_stat(lazyvimpath) then
  local lazyrepo = "https://github.com/LazyVim/LazyVim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", lazyrepo, lazyvimpath })
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazyvimpath)
_G.LazyVim = require("lazyvim.util")
LazyVim.plugin.lazy_file()

vim.opt.number = true
vim.opt.mouse = 'a'
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.g.have_nerd_font = true
vim.opt.cursorline = true
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- require("config.options")
-- require("config.keymaps")
-- require("config.autocmds")

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "catppuccin" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
	update = { notify = false },
})
