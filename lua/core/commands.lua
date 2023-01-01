local autocmd = vim.api.nvim_create_autocmd

-- Change cursor back on vim exit
-- maybe not working?
autocmd('Vimleave', {
	callback = function()
		vim.cmd[[
		set guicursor=a:hor20
		]]
	end,
})

-- Don't list quickfix buffers	
autocmd('FileType', {
	pattern = 'qf',
	callback = function()
		vim.opt_local.buflisted = false
	end,
})
