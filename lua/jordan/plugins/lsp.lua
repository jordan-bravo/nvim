return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    config = function()
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local on_attach = require('jordan.keymaps').on_attach

      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Languages that use the vscode-langservers-extracted (vle) language server
      -- need a different capabilities object
      local vle_capabilities = vim.lsp.protocol.make_client_capabilities()
      vle_capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      vim.lsp.config('*', {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config('cssls', { capabilities = vle_capabilities })
      vim.lsp.config('html', { capabilities = vle_capabilities })

      vim.lsp.config('emmet_ls', {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
      })

      vim.lsp.config('gopls', {
        settings = {
          gopls = {
            gofumpt = true,
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              unusedvariable = true,
            },
          },
        },
      })

      -- TODO: Research the plugin neodev, which helps editing nvim specific lua files
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.stdpath('config') .. '/lua'] = true,
              },
            },
          },
        },
      })

      vim.lsp.config('nil_ls', {
        settings = {
          ['nil'] = {
            formatting = {
              command = { 'nixpkgs-fmt' },
            },
          },
        },
      })

      vim.lsp.config('ruff', {
        init_options = {
          settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
          },
        },
      })

      vim.lsp.enable({
        'ccls',
        'cssls',
        'emmet_ls',
        'gopls',
        'html',
        'lua_ls',
        'nil_ls',
        'pyright',
        'ruff',
        'rust_analyzer',
        'tailwindcss',
        'ts_ls',
      })
    end,
  },
}
