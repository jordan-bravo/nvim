return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    config = function()
      -- import lspconfig plugin
      local lspconfig = require('lspconfig')

      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require('cmp_nvim_lsp')

      local on_attach = require('jordan.keymaps').on_attach

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Languages that use the vscode-langservers-extracted (vle) language server
      -- need a different capabilities object
      local vle_capabilities = vim.lsp.protocol.make_client_capabilities()
      vle_capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      -- configure c & c++ language server
      lspconfig['ccls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure css server
      lspconfig['cssls'].setup({
        capabilities = vle_capabilities,
        on_attach = on_attach,
      })

      -- configure emmet language server
      lspconfig['emmet_ls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
      })

      -- configure golang servers
      lspconfig['gopls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
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

      -- configure graphql language server
      -- lspconfig["graphql"].setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      --   filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      -- })

      -- configure html server
      lspconfig['html'].setup({
        capabilities = vle_capabilities,
        on_attach = on_attach,
      })

      -- configure lua server (with special settings)
      lspconfig['lua_ls'].setup({
        -- TODO: Research the plugin neodev, which helps editing nvim specific lua files
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
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

      -- -- nil_ls
      lspconfig['nil_ls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        autostart = true,
        -- capabilities = caps,
        -- cmd = { lsp_path },
        settings = {
          ['nil'] = {
            formatting = {
              command = { 'nixpkgs-fmt' },
            },
          },
        },
      })

      -- configure prisma orm server
      -- lspconfig["prismals"].setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      -- configure python servers
      -- lspconfig['basedpyright'].setup({
      lspconfig['pyright'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig['ruff'].setup({
        -- capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
          },
        },
      })
      -- configure rust server
      lspconfig['rust_analyzer'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure svelte server
      -- lspconfig["svelte"].setup({
      --   capabilities = capabilities,
      --   on_attach = function(client, bufnr)
      --     on_attach(client, bufnr)
      --
      --     vim.api.nvim_create_autocmd("BufWritePost", {
      --       pattern = { "*.js", "*.ts" },
      --       callback = function(ctx)
      --         if client.name == "svelte" then
      --           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
      --         end
      --       end,
      --     })
      --   end,
      -- })

      -- configure tailwindcss server
      lspconfig['tailwindcss'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure typescript server with plugin
      lspconfig['ts_ls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },
  -- {
  --   'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
  --   config = function()
  --     require('toggle_lsp_diagnostics').init({
  --       start_on = true,
  --     })
  --   end,
  -- },
  -- lsp lines looks cool but there's a problem, where it's unclear how it
  -- interacts with virtual text. Needs further investigation to get the right
  -- combo of starting settings (on/off) and keymaps for the interaction between
  -- virtual text and virtual lines. For now, disabling virtual lines.
  -- {
  --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  --   config = function()
  --     require('lsp_lines').setup()
  --   end,
  -- },
}
