return {
  -- Autocompletion engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",  -- Load cmp on entering insert mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- LSP completion source
      "hrsh7th/cmp-vsnip",      -- Vsnip completion source
      "hrsh7th/cmp-buffer",     -- Buffer completion source
      "hrsh7th/cmp-path",       -- Filesystem path completion source
      "hrsh7th/vim-vsnip",      -- Snippet engine
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- LSP configurations
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },  -- Load lspconfig on buffer read/new file
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Example: Configure pyright for Python
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- Configure rust-analyzer for Rust
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })
    end,
  },
}

