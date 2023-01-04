vim.defer_fn(function()
	pcall(require, 'impatient')
end, 0)

require "core"

local fn = vim.fn
local install_path = fn.stdpath ("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
	print "Cloning packer .."
	fn.system({ "git",
	"clone",
	"--depth",
	"1",
	"https://github.com/wbthomason/packer.nvim",
	install_path })

	-- install plugins & compile their configs
	vim.cmd [[packadd packer.nvim]]
	require "plugins"
	vim.cmd "PackerSync"

	-- Install binaries from mason.nvim & tparsers
	vim.api.nvim_create_autocmd("user", {
		pattern = "PackerComplete",
		callback = function() --start autocmd function
			-- vim.cmd "bw | silent! MasonInstallAll" -- close packer window
			require("packer").loader "nvim-treesitter"
		end, -- ends autocmd function
	})
end
