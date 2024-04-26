return {
  "Mofiqul/vscode.nvim",
  config = function()
    -- vim.o.background = 'dark'
    local colors = require('vscode.colors').get_colors()
    require('vscode').setup({
      -- Transparent background
      transparent = true,
      italic_comments = true,
      -- Underline `@markup.link.*` variants
      underline_links = true,
      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,
      -- Override colors (see ./lua/vscode/colors.lua)
      color_overrides = {
        vscLineNumber = '#FFFFFF',
      },
      -- Override highlight groups (see ./lua/vscode/theme.lua)
      group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=colors.vscDarkBlue, bg=colors.vscLightGreen, bold=true },
      },
    })
    -- Load the theme without affecting devicon colors
    vim.cmd.colorscheme("vscode")
  end,
}
