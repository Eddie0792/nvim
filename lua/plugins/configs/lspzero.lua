local present, lsp = pcall(require, 'lsp-zero')

if not present then
	return
end

lsp.preset('recommended')

lsp.nvim_workspace()
lsp.setup()
