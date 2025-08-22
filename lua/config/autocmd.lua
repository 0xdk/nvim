-- close Neo-tree if it's the only window left
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "neo-tree" and vim.fn.winnr("$") == 1 then
			vim.cmd("Neotree close")
		end
	end,
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local startuptime = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
		vim.g.startup_time_ms = string.format("%.2f ms", startuptime * 1000)
	end,
})

vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BDeletePre *",
	group = "alpha_on_empty",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local name = vim.api.nvim_buf_get_name(bufnr)
		if name == "" then
			vim.cmd([[:Alpha | bd#]])
		end
	end,
})
