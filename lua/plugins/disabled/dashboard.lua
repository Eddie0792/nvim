return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local db = require 'dashboard'
    db.setup {
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
