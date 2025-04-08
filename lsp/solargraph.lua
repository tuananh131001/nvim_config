local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/bin/")

return {
	cmd = { mason_path.."solargraph", "stdio" },
	settings = {
		solargraph = {
			diagnostics = true,
		},
	},
	init_options = { formatting = true },
	filetypes = { "ruby" },
	root_markers = { "Gemfile", ".git" },
}
