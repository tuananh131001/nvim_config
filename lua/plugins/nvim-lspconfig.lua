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

local inlay_hints = {
	enumMemberValues = { enabled = true },
	functionLikeReturnTypes = { enabled = true },
	parameterNames = { enabled = "literals" },
	parameterTypes = { enabled = true },
	propertyDeclarationTypes = { enabled = true },
	variableTypes = { enabled = false },
}
local settings = {
	suggest = { completeFunctionCalls = true },
	inlayHints = inlay_hints,
}

return {
	-- {
	-- 	"hinell/lsp-timeout.nvim",
	-- 	dependencies = { "neovim/nvim-lspconfig" },
	-- 	init = function()
	-- 		vim.g.lspTimeoutConfig = {
	-- 			-- see config below
	-- 			stopTimeout = 1000 * 60 * 5, -- 1 minute
	-- 			startTimeout = 1000 * 10,
	-- 			silent = true,
	-- 		}
	-- 	end,
	-- },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"copilot",
			},
		},
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {},
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			local keymap = vim.keymap -- for conciseness
			vim.lsp.set_log_level("error")
			vim.lsp.config("vtsls", {
				settings = {
					complete_function_calls = true,
					vtsls = {
						enableMoveToFileCodeAction = true,
						experimental = {
							maxInlayHintLength = 30,
							completion = { enableServerSideFuzzyMatch = true },
						},
					},
					typescript = settings,
					javascript = settings,
				},
				single_file_support = true,
				on_attach = function(_client, bufnr)
					local map = require("user.keymap.util").map("Vtsls")

					map(
						{ "n" },
						"<leader>cO",
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
					map(
						{ "n" },
						"<leader>F",
						action_table["source.fixAll.ts"],
						{ buffer = bufnr, desc = "[F]ix All Diagnostics" }
					)
				end,
			})
			vim.lsp.config("intelephense", {
				filetypes = { "php", "inc" },
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf, silent = true }

					opts.desc = "See available code actions"
					keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

					opts.desc = "Smart rename"
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

					opts.desc = "Show buffer diagnostics"
					keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

					opts.desc = "Show line diagnostics"
					keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

					opts.desc = "Go to previous diagnostic"
					keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

					opts.desc = "Go to next diagnostic"
					keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

					opts.desc = "Show documentation for what is under cursor"
					keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

					opts.desc = "Restart LSP"
					keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

					vim.keymap.set("n", "<leader>ih", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}), {})
					end, { desc = "Toggle Inlay Hints" })
				end,
			})
		end,
	},
}
