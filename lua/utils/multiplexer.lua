local M = {}

local directions = {
	h = { tmux = "-L", mado = "left" },
	j = { tmux = "-D", mado = "down" },
	k = { tmux = "-U", mado = "up" },
	l = { tmux = "-R", mado = "right" },
	p = { tmux = "-l" },
}

local function in_tmux()
	return vim.env.TMUX ~= nil and vim.env.TMUX ~= ""
end

local function send(data)
	if vim.api.nvim_ui_send then
		vim.api.nvim_ui_send(data)
	else
		io.stdout:write(data)
	end
end

local function set_user_var(name, value)
	send(string.format("\027]1337;SetUserVar=%s=%s\007", name, vim.base64.encode(value)))
end

function M.navigate(key)
	local win = vim.api.nvim_get_current_win()
	vim.cmd.wincmd(key)
	if vim.api.nvim_get_current_win() ~= win then
		return
	end
	local dir = directions[key]
	if in_tmux() then
		vim.system({ "tmux", "select-pane", dir.tmux })
	elseif dir.mado then
		set_user_var("MADO_ACTION", "move-focus " .. dir.mado)
	end
end

function M.setup()
	for key, lhs in pairs({ h = "<c-h>", j = "<c-j>", k = "<c-k>", l = "<c-l>", p = "<c-\\>" }) do
		vim.keymap.set(key == "p" and "n" or { "n", "t" }, lhs, function()
			M.navigate(key)
		end, { desc = "Navigate " .. (directions[key].mado or "previous") })
	end

	if in_tmux() then
		return
	end

	local group = vim.api.nvim_create_augroup("utils_multiplexer", { clear = true })
	vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
		group = group,
		callback = function()
			set_user_var("IS_NVIM", "true")
		end,
	})
	vim.api.nvim_create_autocmd({ "VimLeavePre", "VimSuspend" }, {
		group = group,
		callback = function()
			set_user_var("IS_NVIM", "")
		end,
	})
	if vim.v.vim_did_enter == 1 then
		set_user_var("IS_NVIM", "true")
	end
end

return M
