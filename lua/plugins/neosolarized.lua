return {
  'svrana/neosolarized.nvim',
  dependencies = 'tjdevries/colorbuddy.nvim',
  config = function()
    require('neosolarized').setup({
      comment_italics = true,
      background_set = false,
    })
    vim.cmd 'colorscheme neosolarized'
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  end
}
