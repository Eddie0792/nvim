return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = "NvimTreeToggle",
  opts = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
      },
    },
    renderer = {
      group_empty = true,
    },
  },
  config = function()
    require("nvim-tree").setup({})
  end,
}
