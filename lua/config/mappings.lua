local g = vim.g
local map = vim.keymap.set
g.mapleader = [[ ]]
local opts = { noremap = true, silent = true }
local bufopts = { noremap = true, silent = true }
--[[----------------------------------------------------------------------------
														Plugin Mappings
--------------------------------------------------------------------------------
]]

-- LSP
map("n", "<leader>fm", function()
	vim.lsp.buf.format({ async = true })
end, bufopts)

-- Telescope
map("n", "<leader>ts", ":Telescope<CR>")
-- Find files
map("n", "<leader>ff", ":Telescope find_files<CR>")
-- File Browser
map("n", "<leader>fd", ":Telescope file_browser<CR>")
-- Buffer picker
map("n", "<leader>fb", ":Telescope buffers<CR>")
-- Help files
map("n", "<leader>fh", ":Telescope help_tags<CR>")
--[[----------------------------------------------------------------------------
														 File Explorer
-------------------------------------------------------------------------------
]]
-- Toggle
map("n", "<C-n>", [[:NvimTreeToggle<CR>]])

--[[----------------------------------------------------------------------------
															Buffers
--------------------------------------------------------------------------------
]]
-- Navigation
map("n", "<Tab>", [[:bn<CR>]])
map("n", "<S-Tab>", [[:bp<CR>]])
map("n", "<leader>x", [[:bd<CR>]])

--[[----------------------------------------------------------------------------
															Windows
--------------------------------------------------------------------------------
]]
-- Layout
-- Navigation
map("n", "sh", [[<C-w>h]])
map("n", "sj", [[<C-w>j]])
map("n", "sk", [[<C-w>k]])
map("n", "sl", [[<C-w>l]])
-- Split
map("n", "ss", [[<C-w>s]])
map("n", "sv", [[<C-w>v]])

--[[----------------------------------------------------------------------------
															Editing
--------------------------------------------------------------------------------
]]
-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })
-- Find and replace word under cursor
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- Move highlighted lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
