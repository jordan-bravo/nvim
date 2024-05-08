-- user/plugins/linting.lua

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')
    -- If linter has property stdin = true, then it can lint even before buffer write,
    -- and therefor supports "TextChanged" property below in the autocmd
    lint.linters_by_ft = {
      javascript = { 'eslint_d' }, -- stdin = true
      typescript = { 'eslint_d' }, -- stdin = true
      javascriptreact = { 'eslint_d' }, -- stdin = true
      typescriptreact = { 'eslint_d' }, -- stdin = true
      svelte = { 'eslint_d' }, -- stdin = true
      python = { 'ruff' }, -- stdin = true
      -- luacheck is currently disabled because I need to figure out how to solve the issue where
      -- it's showing the lint warning: accessing undefined variable 'vim'
      -- lua = { "luacheck" }, -- stdin = true
    }
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
