-- nvim/lua/jordan/options.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 -- repl

vim.opt.hlsearch = false -- set highlight on search
vim.opt.number = true -- show absolute line number
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.mouse = 'a' -- enables mouse
vim.opt.showmode = false -- already shown in status line
vim.opt.breakindent = true -- wrapped lines are visually indented
vim.opt.linebreak = true -- wrap long lines between words rather than mid-word
vim.opt.undofile = true -- save undo history
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive search if search contains uppercase
vim.opt.signcolumn = 'yes' -- always show sign column
vim.opt.updatetime = 250 -- decrease update time for swap file autosave and CursorHold
vim.opt.timeoutlen = 300 -- mapped sequence wait time, e.g. which-key
vim.opt.splitright = true -- default vertical split to the right
vim.opt.splitbelow = true -- default split to the bottom
vim.opt.list = true -- sets how to display certain whitespace chars. see next line
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split' -- live substitution preview while typing
vim.opt.cursorline = true -- show which line the cursor is on
vim.opt.scrolloff = 10 -- minimum lines to keep above and below the cursor
vim.opt.tabstop = 2 -- default tabstop if no filetype match
vim.opt.shiftwidth = 0 -- set shiftwidth to same value as tabstop
vim.opt.expandtab = true -- tabs insert spaces
vim.opt.title = true -- make titlebar show current file name/path
vim.opt.titlestring = '%F' -- full path for title
vim.opt.breakindent = true -- wrapped lines will be visually indented
vim.opt.linebreak = true -- don't line break in the middle words
vim.opt.undofile = true -- save undo history
vim.opt.updatetime = 250 -- decrease update time
vim.opt.timeout = true -- whether to stop waiting for commands
vim.opt.timeoutlen = 300 -- how long to wait before timing out
vim.opt.completeopt = 'menuone,noselect' -- better completion experience
vim.opt.termguicolors = true -- enable 24-bit color in the TUI

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
