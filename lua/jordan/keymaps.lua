-- If highlight on search is enabled, this will clear highlight when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Toggle diagnostic virtual text
vim.keymap.set('n', '<leader>v', '<Plug>(toggle-lsp-diag-vtext)', { silent = true, desc = 'Toggle Virtual Text' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<S-Tab>', '<cmd>bp<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<Tab>', '<cmd>bn<CR>', { desc = 'Next Buffer' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Buffer dependent keymaps
local opts = { noremap = true, silent = true }
local M = {}
M.on_attach = function(client, bufnr)
  opts.buffer = bufnr

  opts.desc = 'Show LSP references'
  vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

  opts.desc = 'Go to declaration'
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

  opts.desc = 'Show LSP definitions'
  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

  opts.desc = 'Show LSP implementations'
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

  opts.desc = 'Show LSP type definitions'
  vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

  opts.desc = 'See available [c]ode [a]ctions'
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  -- Trying to set this here causes an error so instead it's set in plugins/format.lua
  -- opts.desc = '[F]ormat [c]ode in current buffer'
  -- vim.keymap.set({ 'n', 'v' }, '<leader>fc', require('conform').format({ async = true, lsp_fallback = true }), opts) -- run code formatter

  opts.desc = '[F]ormat-on-save [e]nable'
  vim.keymap.set({ 'n', 'v' }, '<leader>fe', '<cmd>FormatEnable<CR>', opts) -- enable format on save

  opts.desc = '[F]ormat-on-save [d]isable'
  vim.keymap.set({ 'n', 'v' }, '<leader>fd', '<cmd>FormatDisable<CR>', opts) -- disable format on save

  opts.desc = 'Close buffer'
  vim.keymap.set({ 'n', 'v' }, '<leader>p', '<cmd>bd<cr>', opts) -- close current buffer

  opts.desc = 'Smart rename'
  vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = 'Show buffer diagnostics'
  vim.keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- show  diagnostics for file

  opts.desc = 'Show line diagnostics'
  vim.keymap.set('n', '<leader>z', vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = 'Go to previous diagnostic'
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

  opts.desc = 'Go to next diagnostic'
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

  opts.desc = 'Show documentation for what is under cursor'
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = 'Restart LSP'
  vim.keymap.set('n', '<leader>rl', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary

  opts.desc = '[D]ocument [S]ymbols'
  vim.keymap.set(
    'n',
    '<leader>ds',
    require('telescope.builtin').lsp_document_symbols,
    { buffer = bufnr, desc = opts.desc }
  )

  opts.desc = '[W]orkspace [S]ymbols'
  vim.keymap.set(
    'n',
    '<leader>ws',
    require('telescope.builtin').lsp_dynamic_workspace_symbols,
    { buffer = bufnr, desc = opts.desc }
  )

  -- See `:help K` for why this keymap
  opts.desc = 'Hover Documentation'
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = opts.desc })

  opts.desc = 'Signature Documentation'
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = opts.desc })

  -- Lesser used LSP functionality
  opts.desc = '[G]oto [D]eclaration'
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = opts.desc })

  opts.desc = '[W]orkspace [A]dd Folder'
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = opts.desc })

  opts.desc = '[W]orkspace [R]emove Folder'
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = opts.desc })

  -- local list_workspace_folders = function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end
  -- opts.desc = "[W]orkspace [L]ist Folders"
  -- vim.keymap.set("n", "<leader>wl", list_workspace_folders(), { buffer = bufnr, desc = opts.desc })
end
M.dap = {
  plugin = true,
  n = {
    ['<leader>b'] = { '<cmd> DapToggleBreakpoint <CR>' },
  },
}
M.dap_python = {
  plugin = true,
  n = {
    ['<leader>dpr'] = {
      function()
        require('dap-python').test_method()
      end,
    },
  },
}
return M
