
local lspconfig = require("lspconfig")

-- Define a common on_attach function to map LSP-related keybinds
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- Basic LSP mappings
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
end

-- Rust LSP (rust-analyzer)
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
})

-- Python LSP (pyright)
lspconfig.pyright.setup({
  on_attach = on_attach,
})

-- C++ LSP (clangd)
lspconfig.clangd.setup({
  on_attach = on_attach,
})

