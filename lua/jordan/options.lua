-- nvim/lua/jordan/options.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a' -- enables mouse
vim.opt.showmode = false -- already shown in status line
vim.opt.breakindent = true -- wrapped lines are visually indented
vim.opt.undofile = true -- save undo history
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive search if search contains uppercase
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250 -- decrease update time for swap file autosave and CursorHold
vim.opt.timeoutlen = 300 -- mapped sequence wait time, e.g. which-key
vim.opt.splitright = true -- default vertical split to the right
vim.opt.splitbelow = true -- default split to the bottom
vim.opt.list = true -- sets how to display certain whitespace chars
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split' -- live substitution preview while typing
vim.opt.cursorline = true -- show which line the cursor is on
vim.opt.scrolloff = 10 -- minimum lines to keep above and below the cursor
vim.opt.tabstop = 2 -- default tabstop if no filetype match
vim.opt.shiftwidth = 0 -- set shiftwidth to same value as tabstop
vim.opt.expandtab = true -- tabs insert spaces
