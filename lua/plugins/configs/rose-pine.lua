local present, rose_pine = pcall(require, 'rose-pine')

if not present then
  return
end

local color = color or "rose-pine"
vim.cmd.colorscheme(color)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
