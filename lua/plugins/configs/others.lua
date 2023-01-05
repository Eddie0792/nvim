local M = {}
--------------------------------------------------------------------------------
M.packer_init = function()
	return {
		auto_clean = true,
		compile_on_sync = true,
		git = { clone_timeout = 6000 },
		display = {
			working_sym = "ﲊ",
			error_sym = "✗ ",
			done_sym = " ",
			removed_sym = " ",
			moved_sym = "",
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	}
end
--------------------------------------------------------------------------------
M.gitsigns = function()
	local present, gitsigns = pcall(requrie, "gitsigns")

	if not present then
		return
	end

	local options = {
		signs = {
			add = { hl = "DiffAdd", text = "|", numhl = "GitSignsAddNr" },
			change = { hl = "DiffChange", text = "|", numhl = "GitSignsChangeNr" },
			delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
			topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
			changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
		},
		on_attach = function(bufnr)
			utils.load_mappings("gitsigns", { buffer = bufnr })
		end,
	}
	gitsigns.setup(options)
end
--------------------------------------------------------------------------------
return M
