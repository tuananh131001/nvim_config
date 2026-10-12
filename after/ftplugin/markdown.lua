vim.keymap.set("n", "<leader>mo", function()
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" then
		vim.notify("MDView: buffer has no file", vim.log.levels.WARN)
		return
	end
	if vim.fn.executable("mdview") == 0 then
		vim.notify("MDView: mdview not found in PATH", vim.log.levels.ERROR)
		return
	end

	vim.cmd("silent update")
	local line = vim.api.nvim_win_get_cursor(0)[1]
	vim.system({ "mdview", ("%s:%d"):format(path, line) }, { text = true }, function(out)
		if out.code ~= 0 then
			vim.schedule(function()
				vim.notify("MDView: " .. vim.trim(out.stderr ~= "" and out.stderr or out.stdout), vim.log.levels.ERROR)
			end)
		end
	end)
end, { buffer = true, desc = "Open in MDView" })
