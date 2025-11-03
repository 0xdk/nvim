return {
	vim.lsp.config("html", {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			-- HTML specific logic
			print("Attached to html")
		end,
	}),
}
