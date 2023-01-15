return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    -- Snippet Collection (Optional)
    { 'rafamadriz/friendly-snippets' },
  },
  event = 'BufReadPost',
  config = function()
    local lsp = require 'lsp-zero'
    lsp.preset 'recommended'

    -- Configure the lua langauge server for neovim
    lsp.nvim_workspace()

    lsp.setup()
  end,
}
