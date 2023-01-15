return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'BufReadPost',
  config = function()
    require('bufferline').setup {}
  end,
}
