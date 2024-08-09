return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute({ toggle = true })
      end,
      desc = 'Explorer NeoTree (Root Dir)',
    },
  },
  opts = {
    -- default values
    -- default_component_configs = {
    --   indent = {
    --     with_markers = true,
    --     indent_marker = '│',
    --     last_indent_marker = '└',
    --     highlight = 'NeoTreeIndentMarker',
    --     -- The help section says the following but doesn't give any more info:
    --     -- To change highlight of indent markers, you need configure `NeoTreeIndentMarker`
    --     -- highlight group. By default, it refers to `Normal` highlight.
    --   },
    -- },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      hijack_netrw_behavior = 'open_default',
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
  },
}
