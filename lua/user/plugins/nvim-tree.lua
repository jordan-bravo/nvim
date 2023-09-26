-- user/plugins/nvim_tree

return {
  "nvim-tree/nvim-web-devicons",
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        filters = {
          -- dotfiles = false,
          git_ignored = false,
          custom = {}, -- These will be filtered (hidden)
          exclude = {}, -- These will be shown
        },
      })
    end,
  },
}
