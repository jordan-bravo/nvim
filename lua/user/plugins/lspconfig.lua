-- user/plugins/lspconfig.lua

-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { "j-hui/fidget.nvim",       tag = "legacy", opts = {} },
    "folke/neodev.nvim",
    "nvim-lua/plenary.nvim",
    "lukas-reineke/lsp-format.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",

  },
  config = function()
    local lspconfig = require("lspconfig")
    require("lsp-format").setup({}) 
    require("neodev").setup()

    local on_attach = function(client, bufnr)
        require("lsp-format").on_attach(client, bufnr)
        -- ... custom code ...
    end



    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    lspconfig.tsserver.setup({ on_attach = on_attach })
    lspconfig.pyright.setup({ on_attach = on_attach })
    lspconfig.rust_analyzer.setup({
      -- Server-specific settings. See `:help lspconfig-setup`
      on_attach = on_attach,
      cmd = { "rustup", "run", "stable", "rust-analyzer" },
      settings = {
        ['rust-analyzer'] = {
          check = {
            overrideCommand = "cargo clippy"
          }
        },
      },
    })

    -- local servers = {
    --   -- Lua
    --   lua_ls = {
    --     Lua = {
    --       workspace = { checkThirdParty = false }, -- make a note here of what this does
    --       telemetry = { enable = false },
    --       diagnostics = {
    --         -- Get the language server to recognize the "vim" global variabe
    --         globals = { "vim" },
    --       },
    --     },
    --   },
    -- }

    -- local null_ls = require("null-ls")
    -- null_ls.setup({
    --   sources = {
    --     -- JavaScript, TypeScript
    --     -- null_ls.builtins.formatting.prettier,
    --
    --     -- Lua
    --     null_ls.builtins.formatting.stylua,
    --     -- null_ls.builtins.completion.luasnip,
    --     -- null_ls.builtins.diagnostics.luacheck,
    --
    --     -- Nix
    --     null_ls.builtins.formatting.nixpkgs_fmt,
    --
    --     -- Python
    --     null_ls.builtins.formatting.black, -- .with({
    --     --   extra_args = { "--line-length=120" },
    --     -- }),
    --     null_ls.builtins.diagnostics.ruff,
    --
    --     -- Refactoring for Go, Javascript, Lua, Python, TypeScript
    --     null_ls.builtins.code_actions.refactoring,
    --
    --     -- Rust
    --     null_ls.builtins.formatting.rustfmt,
    --   },
    -- })
  end
}
