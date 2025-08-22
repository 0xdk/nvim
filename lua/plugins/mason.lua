return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = { "lua_ls", "pyright", "html", "cssls" }, -- add or remove servers as you wish
        automatic_installation = true,
    },
}

