return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local b = require('null-ls').builtins
    require('null-ls').setup {
      sources = {
        b.formatting.stylua,
        b.formatting.prettierd,
        b.formatting.black.with { extra_args = { '-l 80' } },
      },
    }
  end,
}
