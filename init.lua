vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set space as Leader and backslash as LocalLeader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Load your plugins, Lazy bootstrapping, etc.
require("config.lazy")

-- key mappings
require("config.mappings")
require("luasnip.loaders.from_vscode").lazy_load()
-- auto commands
require("config.autocmd")
require("config.options")
