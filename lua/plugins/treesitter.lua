return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufReadPost',
  opts = {
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    ensure_installed = {
      'lua',
      'help',
      'vim',
      'python',
      'query',
      'regex',
      'yaml',
      'c',
    },
  },
}
