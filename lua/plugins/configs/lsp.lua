require('mason').setup()


require('mason-lspconfig').setup {
  ensure_installed = {
    'sumneko_lua',
    'clangd',
  },
}

local lspconfig = require('lspconfig')
local get_servers = require('mason-lspconfig').get_installed_servers

for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
  })
end
