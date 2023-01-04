local g = vim.g
local opt = vim.opt

-- System
opt.scrolloff = 8
opt.showmode = false
opt.updatetime = 250 -- Swap file write interval, also used by gitsigns
opt.timeoutlen = 400
opt.termguicolors = true
opt.swapfile = true
opt.backup = true
opt.undofile = true
opt.clipboard = 'unnamedplus'
opt.mouse = 'a'

-- Search
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true

-- User powershell

--[[
                          USER INTERFACE
--]]
-- Cursor
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
opt.cursorline = true
opt.rnu = false
opt.colorcolumn = '80'

-- Not sure what to call this group
opt.splitbelow = true
opt.splitright = true

-- Numbers
opt.signcolumn = 'yes'
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- not too sure
opt.fillchars = { eob = " " }

-- Statusline
opt.laststatus = 3 -- Global statusline

-- Indenting
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.wrap = false
opt.smartindent = true

-- Explorer
-- :h netrw-browser-var
g.netrw_winsize = 15
g.netrw_liststyle = 3 -- Tree style directory
g.netrw_browse_split = 4
g.netrw_liststyle = 3
g.netrw_banner = 0

--[[ Use Tab
If this variable exists and is non-zero, then the <tab> map supporting
shrinking/expanding a Lexplore or netrw window will be enabled.
(see :h netrw-c-tab)
--]]
g.netrw_usetab = 1
