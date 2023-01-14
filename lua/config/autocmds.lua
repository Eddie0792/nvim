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

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'qf',
    'help',
    'man',
    'notify',
    'lspinfo',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'PlenaryTestPopup',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})
