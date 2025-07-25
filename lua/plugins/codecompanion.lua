return {
	{
		"olimorris/codecompanion.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("codecompanion").setup({
				prompt_library = {
					["Code Expert"] = {
						strategy = "chat",
						description = "Get some special advice from an LLM",
						opts = {
							short_name = "expert",
							auto_submit = true,
							stop_context_insertion = true,
							user_prompt = true,
						},
						prompts = {
							{
								role = "system",
								content = function(context)
									return "I want you to act as a senior "
										.. context.filetype
										.. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
								end,
							},
							{
								role = "user",
								content = function(context)
									local text = require("codecompanion.helpers.actions").get_code(
										context.start_line,
										context.end_line
									)

									return "I have the following code:\n\n```"
										.. context.filetype
										.. "\n"
										.. text
										.. "\n```\n\n"
								end,
								opts = {
									contains_code = true,
								},
							},
						},
					},
				},
				adapters = {
					copilot = function()
						return require("codecompanion.adapters").extend("copilot", {
							schema = {
								model = {
									default = "claude-3.5-sonnet",
								},
							},
						})
					end,
				},
				display = {
					diff = {
						enabled = true,
						close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
						layout = "vertical", -- vertical|horizontal split for default provider
						opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
						provider = "mini_diff", -- default|mini_diff
					},
					chat = {
						intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
						show_header_separator = false,
						separator = "─",
						show_references = true,
						show_settings = true,
						show_token_count = true,
						start_in_insert_mode = false, -- Open the chat buffer in insert mode?
						window = {
							position = "right",
						},
					},
				},
				strategies = {
					chat = {
						slash_commands = {
							["buffer"] = {
								callback = "strategies.chat.slash_commands.buffer",
								description = "Select a buffer using snack",
								opts = {
									provider = "snacks",
									contains_code = true,
								},
							},
							["file"] = {
								callback = "strategies.chat.slash_commands.file",
								description = "Select a file using snack",
								opts = {
									provider = "snacks",
									contains_code = true,
								},
							},
						},
						roles = {
							user = "tuananh131001",
						},
						adapter = "copilot",
					},
					inline = {
						adapter = "copilot",
					},
				},
			})
			vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<CR>", { noremap = true, silent = true })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>co",
				"<cmd>CodeCompanionChat Toggle<cr>",
				{ noremap = true, silent = true }
			)
			vim.keymap.set({ "v" }, "<leader>ce", "<cmd>CodeCompanion /expert<cr>", { noremap = true, silent = true })
		end,
	},
}
