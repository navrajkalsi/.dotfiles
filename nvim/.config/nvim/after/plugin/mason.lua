require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "lua_ls",
    "pyright",
    "ts_ls",
  },
  automatic_installation = true,
})
