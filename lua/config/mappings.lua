vim.g.mapleader = [[ ]]

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--------------------------------------------------------------------------------
------------------------------ LSP ---------------------------------------------
--------------------------------------------------------------------------------
map('n', '<leader>fm', function()
  vim.lsp.buf.format { async = true }
end, opts)

--------------------------------------------------------------------------------
------------------------------ Telescope ---------------------------------------
--------------------------------------------------------------------------------
local builtin = require 'telescope.builtin'
local ext = require('telescope').extensions

map('n', '<leader>ts', ':Telescope<CR>')
-- Find files
map('n', '<leader>ff', function()
  builtin.find_files()
end, opts)
-- File Browser
map('n', '<leader>fd', function()
  ext.file_browser.file_browser()
end)
-- Buffer picker
map('n', '<leader>fb', function()
  builtin.buffers()
end, opts)
-- Help files
map('n', '<leader>fh', function()
  builtin.help_tags()
end, opts)
-- Treeesitter Picker: List function names and variables
map('n', '<leader>tt', function()
  builtin.treesitter()
end, opts)

-- Cheatsheet
map('n', '<leader>?', '<cmd>Cheatsheet<cr>')


--------------------------------------------------------------------------------
------------------------------ File Explorer -----------------------------------
--------------------------------------------------------------------------------
-- Toggle
map('n', '<C-n>', [[:NvimTreeToggle<CR>]])

--------------------------------------------------------------------------------
------------------------------- Buffers ----------------------------------------
--------------------------------------------------------------------------------
-- Navigation
map('n', '<Tab>', [[:bn<CR>]])
map('n', '<S-Tab>', [[:bp<CR>]])
map('n', '<leader>x', [[:bd<CR>]])

--------------------------------------------------------------------------------
-------------------------------- Windows ---------------------------------------
--------------------------------------------------------------------------------
-- Layout
-- Navigation
map('n', 'sh', [[<C-w>h]])
map('n', 'sj', [[<C-w>j]])
map('n', 'sk', [[<C-w>k]])
map('n', 'sl', [[<C-w>l]])
-- Split
map('n', 'ss', [[<C-w>s]])
map('n', 'sv', [[<C-w>v]])

--------------------------------------------------------------------------------
------------------------------- Editing ----------------------------------------
--------------------------------------------------------------------------------
-- Clear search with <esc>
map(
  { 'i', 'n' },
  '<esc>',
  '<cmd>noh<cr><esc>',
  { desc = 'Escape and clear hlsearch' }
)
-- Find and replace word under cursor
map('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
-- Move highlighted lines
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
