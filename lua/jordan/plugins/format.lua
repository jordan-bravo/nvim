vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
    print('Format-on-save disabled for this buffer')
  else
    vim.g.disable_autoformat = true
    print('Format-on-save disabled globally')
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
  print('Format-on-save enabled')
end, {
  desc = 'Re-enable autoformat-on-save',
})

local prettier = { 'prettierd', 'prettier', stop_after_first = true }

return {
  -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>cfn',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = '',
      desc = '[C]ode [f]ormat [n]ow in current buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save" with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Disable "lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      javascript = prettier,
      typescript = prettier,
      javascriptreact = prettier,
      typescriptreact = prettier,
      svelte = prettier,
      css = prettier,
      html = prettier,
      json = prettier,
      yaml = prettier,
      markdown = prettier,
      graphql = prettier,
      go = { 'gofmt' },
      lua = { 'stylua' },
      nix = { 'nixpkgs-fmt' },
      python = { 'ruff_fix', 'ruff_format' },
      rust = { 'rustfmt' },
    },
  },
}
