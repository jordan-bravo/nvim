return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'folke/neodev.nvim',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    -- Neodev is recommended to give neotest type checking, docs, and autocomplete
    -- Neodev requires cmp, so uncomment these lines after cmp is configured
    require('neodev').setup({
      library = { plugins = { 'neotest' }, types = true },
    })
    require('neotest').setup({
      adapters = {
        require('neotest-jest')({
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      },
    })
    -- Run jest tests in watch mode
    vim.api.nvim_set_keymap(
      'n',
      '<leader>tw',
      "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
      { desc = '[W]atch mode' }
    )
  end,
}
