-- user/keymaps.lua

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Toggle File Explorer
-- vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })

-- Copy to end of line
-- vim.keymap.set('n', 'Y', 'y$', { silent = true })

-- Toggle diagnostic virtual text
-- vim.keymap.set('n', '<leader>v', '<Plug>(toggle-lsp-diag-vtext)', { silent = true, desc = 'Toggle Virtual Text' })

-- LSP related actions:
-- Format
-- vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>")

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Close current buffer
vim.keymap.set('n', '<leader>k', ':bd<CR>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Navigate buffers
-- vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
-- vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })

-- Buffer dependent keymaps
-- local opts = { noremap = true, silent = true }
-- local M = {}
-- M.on_attach = function(client, bufnr)
--   opts.buffer = bufnr
--
--   opts.desc = 'Show LSP references'
--   vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references
--
--   opts.desc = 'Go to declaration'
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration
--
--   opts.desc = 'Show LSP definitions'
--   vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions
--
--   opts.desc = 'Show LSP implementations'
--   vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations
--
--   opts.desc = 'Show LSP type definitions'
--   vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions
--
--   opts.desc = 'See available code actions'
--   vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
--
--   opts.desc = 'Smart rename'
--   vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, opts) -- smart rename
--
--   opts.desc = 'Show buffer diagnostics'
--   vim.keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- show  diagnostics for file
--
--   opts.desc = 'Show line diagnostics'
--   vim.keymap.set('n', '<leader>z', vim.diagnostic.open_float, opts) -- show diagnostics for line
--
--   opts.desc = 'Go to previous diagnostic'
--   vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
--
--   opts.desc = 'Go to next diagnostic'
--   vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
--
--   opts.desc = 'Show documentation for what is under cursor'
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
--
--   opts.desc = 'Restart LSP'
--   vim.keymap.set('n', '<leader>rl', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
--
--   opts.desc = '[D]ocument [S]ymbols'
--   vim.keymap.set(
--     'n',
--     '<leader>ds',
--     require('telescope.builtin').lsp_document_symbols,
--     { buffer = bufnr, desc = opts.desc }
--   )
--
--   opts.desc = '[W]orkspace [S]ymbols'
--   vim.keymap.set(
--     'n',
--     '<leader>ws',
--     require('telescope.builtin').lsp_dynamic_workspace_symbols,
--     { buffer = bufnr, desc = opts.desc }
--   )
--
--   -- See `:help K` for why this keymap
--   opts.desc = 'Hover Documentation'
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = opts.desc })
--
--   opts.desc = 'Signature Documentation'
--   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = opts.desc })
--
--   -- Lesser used LSP functionality
--   opts.desc = '[G]oto [D]eclaration'
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = opts.desc })
--
--   opts.desc = '[W]orkspace [A]dd Folder'
--   vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = opts.desc })
--
--   opts.desc = '[W]orkspace [R]emove Folder'
--   vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = opts.desc })
--
--   -- local list_workspace_folders = function()
--   --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   -- end
--   -- opts.desc = "[W]orkspace [L]ist Folders"
--   -- vim.keymap.set("n", "<leader>wl", list_workspace_folders(), { buffer = bufnr, desc = opts.desc })
-- end
-- M.dap = {
--   plugin = true,
--   n = {
--     ['<leader>b'] = { '<cmd> DapToggleBreakpoint <CR>' },
--   },
-- }
-- M.dap_python = {
--   plugin = true,
--   n = {
--     ['<leader>dpr'] = {
--       function()
--         require('dap-python').test_method()
--       end,
--     },
--   },
-- }
-- return M
