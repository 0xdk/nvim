return {
	vim.lsp.config("ts_ls", {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			-- TypeScript specific logic
			print("Attached to ts_ls")
		end,
	}),
}
