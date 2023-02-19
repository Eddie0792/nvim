return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- LSP Support
    { 'williamboman/mason.nvim' }, -- Optional
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
    require('mason').setup()
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- create your own bindings here...
    end
    require('lspconfig').sumneko_lua.setup {
      settings = {
        Lua = {
          runtime = {
            -- tell the langauge server which version of Lua we're using
            version = 'LuaJIT',
          },
          diagnostics = {
            -- get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
          },
          -- Don't send telemitry
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end,
}
