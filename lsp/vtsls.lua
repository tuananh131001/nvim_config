local action_table = setmetatable({}, {
	---@param action lsp.CodeActionKind Actions not of this kind are filtered out by the client before being shown
	---@return function
	__index = function(_, action)
		return function()
			vim.lsp.buf.code_action({
				apply = true,
				context = {
					only = { action },
					diagnostics = {},
				},
			})
		end
	end,
})

local M = {}

function M.map(str)
	---@param mode string|string[] Mode "short-name" (see |nvim_set_keymap()|), or a list thereof.
	---@param lhs string           Left-hand side |{lhs}| of the mapping.
	---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
	---@param opts? vim.keymap.set.Opts
	return function(mode, lhs, rhs, opts)
		opts = opts or {}
		opts.desc = ("%s: %s"):format(str, (opts.desc or ""))

		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

---@type vim.lsp.Config
return {
	root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
	cmd = { "vtsls", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	single_file_support = true,
	on_attach = function(_client, bufnr)
		local map = M.map("Vtsls")

		map(
			{ "n" },
			"<leader>co",
			action_table["source.organizeImports"],
			{ buffer = bufnr, desc = "[O]rganize Imports" }
		)
		map(
			{ "n" },
			"<leader>cM",
			action_table["source.addMissingImports.ts"],
			{ buffer = bufnr, desc = "Add [M]issing Imports" }
		)
		map(
			{ "n" },
			"<leader>cD",
			action_table["source.removeUnused.ts"],
			{ buffer = bufnr, desc = "Remove Unused Imports" }
		)
		map({ "n" }, "<leader>F", action_table["source.fixAll.ts"], { buffer = bufnr, desc = "[F]ix All Diagnostics" })
	end,
}
