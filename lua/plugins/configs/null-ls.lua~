local present, null_ls = pcall(require, 'null-ls')

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  sources = {
    -- Lua
    b.formatting.stylua,
    -- YAML
  }
}

null_ls.setup {
  debug = false,
  sources = sources,
}
