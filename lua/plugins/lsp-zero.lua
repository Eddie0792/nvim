return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { 'williamboman/mason.nvim' }, -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' }, -- Optional
    { 'hrsh7th/cmp-path' }, -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' }, -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' }, -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    local lsp = require 'lsp-zero'

    lsp.preset 'recommended'

    lsp.ensure_installed {
      'lua_ls',
    }

    -- Fix Undefined global 'vim'
    lsp.configure('lua-language-server', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    local cmp = require 'cmp'
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings {
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),

      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

      ['<C-y>'] = cmp.mapping.confirm { select = true },

      ['<C-Space>'] = cmp.mapping.complete(),
    }

  end,
}
