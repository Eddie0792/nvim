M = {}

M.format = function()
  vim.lsp.buf.format(stylua)
end

return M
