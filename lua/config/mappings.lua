-- lua/config/mappings.lua

-- Mappgins for LSP
-- LSP Key Mappings for Neovim
local opts = { noremap = true, silent = true }

-- Go to the definition of the symbol under the cursor
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

-- Go to the declaration of the symbol under the cursor
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

-- Show hover documentation for symbol under the cursor
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- Go to the implementation of the symbol under the cursor
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { unpack(opts) })

-- List all references to the symbol under the cursor
vim.keymap.set("n", "gr", vim.lsp.buf.references, { unpack(opts) })

-- Rename all references to the symbol under the cursor
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { unpack(opts) })

-- Show available code actions (quick fixes, refactors, etc.) for the current cursor position or visual selection
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { unpack(opts) })

-- Jump to previous diagnostic (error/warning) in buffer
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { unpack(opts) })

-- Jump to next diagnostic (error/warning) in buffer
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { unpack(opts) })

-- Open floating window with all diagnostics for the current line
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { unpack(opts) })

-- Show function signature help (parameters, docs) in insert mode
vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)

-- Git Signs Mappings (learn about these mappings)
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>")

-- Prettier (format file or range)
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, opts)

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>q", ":BufferClose<CR>", opts)
vim.keymap.set("n", "<leader>Q", ":BufferClose!<CR>", opts)
vim.keymap.set("n", "<leader>U", ":bufdo bd<CR>", opts) -- Close all buffers
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>:bnext<CR>", opts) -- Vertical split and open next buffer

-- Goto buffer in position...
vim.keymap.set("n", "<leader>hh", "<Cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "<leader>ll", "<Cmd>BufferMoveNext<CR>")
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
vim.keymap.set("n", "<A-p>", "<Cmd>BuffersPin<CR>", opts)

-- Window navigation
--vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- Move cursor to the window left
--vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- Move cursor to the window below
--vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- Move cursor to the window above
--vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- Move cursor to the window right

-- Window resizing
vim.keymap.set("n", "<F5>", ":resize +2<CR>", opts) -- Increase window height by 2 lines
vim.keymap.set("n", "<F6>", ":resize -2<CR>", opts) -- Decrease window height by 2 lines
vim.keymap.set("n", "<F7>", ":vertical resize +2<CR>", opts) -- Increase window width by 2 columns
vim.keymap.set("n", "<F8>", ":vertical resize -2<CR>", opts) -- Decrease window width by 2 columns

-- misc
vim.keymap.set("n", "<leader>s", ":%s//g<Left><Left>", opts) -- replace all
--vim.keymap.set("n", "<leader>p", switch_theme, opts) -- cycle themes
vim.keymap.set("n", "<leader>P", ":Lazy<CR>", opts) -- Lazy nvim
vim.keymap.set("n", "<leader>z", ":lua require('FTerm').open()<CR>", opts) -- open term
vim.keymap.set("n", "<leader>th", ":lua require('FTerm').scratch({ cmd = 'htop' })<CR>", opts) -- open htop
vim.keymap.set("t", "<Esc>", '<C-\\><C-n><CMD>lua require("FTerm").close()<CR>', opts) -- preserves session
vim.keymap.set("n", "<leader>w", ":w<CR>", opts) -- write but one less key
vim.keymap.set("n", "<leader>d", ":w ", opts) -- duplicate to new name (waits for input)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts) -- make a file executable
vim.keymap.set("n", "<leader>mv", ":!mv % ", opts) -- move a file to a new dir (waits for input)
vim.keymap.set("n", "<leader>R", ":so %<CR>", opts) -- reload neovim config
--vim.keymap.set("n", "<leader>u", ':silent !xdg-open "<cWORD>" &<CR>', opts) -- open a url under cursor
vim.keymap.set("v", "<leader>i", "=gv", opts) -- auto indent
vim.keymap.set("n", "<leader>W", ":set wrap!<CR>", opts) -- toggle wrap
vim.keymap.set("n", "<leader>l", ":Twilight<CR>", opts) -- surrounding dim
vim.keymap.set("n", "<C-/>", "gcc", { remap = true }) -- comment an line
vim.keymap.set("v", "<C-/>", "gc", { remap = true }) -- comment selected lines

vim.keymap.set("n", "<leader>nn", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
	end
end, opts)
