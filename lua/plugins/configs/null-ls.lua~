local present, null_ls = pcall(require, 'null-ls')

if not present then
  return
end

local f = null_ls.builtins.formatting
local d = null_ls.builtins.diagnostics
local c = null_ls.builtins.completion

null_ls.setup({
  sources = {
    f.stylua,
  }
})
