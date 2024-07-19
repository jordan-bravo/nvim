return {
  'tpope/vim-sleuth', -- detect tabstop and shiftwidth automatically
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help indent_blankline.txt`
    main = 'ibl',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
    config = function()
      require('ibl').setup()
    end,
  },
}
