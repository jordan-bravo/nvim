-- user/plugins/lspconfig.lua

-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
  -- LSP Configuration & Plugins
  -- "neovim/nvim-lspconfig",
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    -- { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
    -- "folke/neodev.nvim",
    "nvim-lua/plenary.nvim",
    -- "lukas-reineke/lsp-format.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",
    -- "nvimtools/none-ls.nvim",

  },
  config = function()
    -- local lspconfig = require("lspconfig")
    -- require("lsp-format").setup({})
    -- require("neodev").setup()

    -- local on_attach = function(client, bufnr)
    --   require("lsp-format").on_attach(client, bufnr)
    --   -- ... custom code ...
    -- end



    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- JavaScript / TypeScript
    -- lspconfig.tsserver.setup({
    --   on_attach = require("lsp-format").on_attach,
    --   -- capabilities = capabilities,
    --   settings = {
    --     completions = {
    --       completeFunctionCalls = true
    --     }
    --   }
    -- })
    -- Lua
    -- lspconfig.lua_ls.setup({
    --   on_attach = require("lsp-format").on_attach,
    --   -- capabilities = capabilities,
    --   settings = {
    --     Lua = {
    --       workspace = { checkThirdParty = false }, -- make a note here of what this does
    --       runtime = {
    --         -- Tell the language server which version of Lua you're using
    --         -- (most likely LuaJIT in the case of Neovim)
    --         version = 'LuaJIT'
    --       },
    --       telemetry = { enable = false },
    --       completion = {
    --         callSnippet = 'Replace',
    --       },
    --       hint = {
    --         enable = true,
    --         arrayIndex = 'Disable',
    --       },
    --       diagnostics = {
    --         -- Get the language server to recognize the "vim" global variabe
    --         globals = { "vim" },
    --       },
    --     },
    --   },
    -- })

    -- Python
    -- TODO: enable Black formatter
    -- lspconfig.pyright.setup({
    --   on_attach = require("lsp-format").on_attach,
    --   -- capabilities = capabilities,
    -- })
    -- lspconfig.ruff_lsp.setup({
    --   on_attach = require("lsp-format").on_attach,
    --   -- capabilities = capabilities,
    --   init_options = {
    --     settings = {
    --       -- Any extra CLI arguments for ruff go here.
    --       args = {},
    --     }
    --   }
    -- })
    -- Rust
    -- lspconfig.rust_analyzer.setup({
    --   -- Server-specific settings. See `:help lspconfig-setup`
    --   on_attach = require("lsp-format").on_attach,
    --   -- capabilities = capabilities,
    --   cmd = { "rustup", "run", "stable", "rust-analyzer" },
    --   settings = {
    --     ['rust-analyzer'] = {
    --       check = {
    --         overrideCommand = "cargo clippy"
    --       }
    --     },
    --   },
    -- })

    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      sources = {
        -- JavaScript, TypeScript
        -- formatting.prettier,

        -- Lua
        -- formatting.stylua,
        -- completion.luasnip,
        -- diagnostics.luacheck,

        -- Nix
        -- formatting.nixpkgs_fmt,

        -- Python
        -- formatting.black, -- .with({
        --   extra_args = { "--line-length=120" },
        -- }),
        diagnostics.ruff,
        formatting.ruff,

        -- Refactoring for Go, Javascript, Lua, Python, TypeScript
        -- code_actions.refactoring,

        -- Rust
        -- formatting.rustfmt,
      },
    })
  end
}
