--[[----------------------------------------------------------------------------
																	Plugin Table
-------------------------------------------------------------------------------
]]
--

local plugins = {
	-- Blankline
	["lukas-reineke/indent-blankline.nvim"] = {
		config = function()
			require("plugins.configs.blankline")
		end,
	},

	-- Bufferline
	["akinsho/bufferline.nvim"] = {
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},

	["lewis6991/gitsigns.nvim"] = {
		ft = "gitcommit",
		setup = function()
			require("core.lazy_load").gitsigns()
		end,
		config = function()
			require("plugins.configs.others").gitsigns()
		end,
	},

	-- Treesitter
	["nvim-treesitter/nvim-treesitter"] = {
		module = "nvim-treesitter",
		setup = function()
			require("core.lazy_load").on_file_open("nvim-treesitter")
		end,
		cmd = require("core.lazy_load").treesitter_cmds,
		run = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},

	-- lspzero
	["VonHeikemen/lsp-zero.nvim"] = {
		requires = {
			--LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			require("plugins.configs.lspzero")
		end,
	},

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("plugins.configs.null-ls")
		end,
	},

	-- Telescope
	["nvim-telescope/telescope.nvim"] = {
		requires = "nvim-telescope/telescope-file-browser.nvim",
		cmd = "Telescope",
		config = function()
			require("plugins.configs.telescope")
		end,
	},

	["nvim-tree/nvim-tree.lua"] = {
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		tag = "nightly",
		config = function()
			-- default settings
			require("nvim-tree").setup()
		end,
	},

	-- Autopairs
	["windwp/nvim-autopairs"] = {
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	["nvim-treesitter/playground"] = {},
	-- Impatient
	["lewis6991/impatient.nvim"] = {},

	-- Theme
	["rose-pine/neovim"] = {
		as = "rose-pine",
		config = function()
			local color = color or "rose-pine"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	-- Theme creator
	["rktjmp/lush.nvim"] = {},

	["folke/lsp-colors.nvim"] = {},
}
--[[--------------------------------------------------------------------------
													Merge Plugin Function
------------------------------------------------------------------------------
								Takes plugins from default_config.lua
										runs it through a table merge
								& reformats it to match packer syntax.

						merge_plugins() - WORKING AND READY FOR EXPORT
--[[------------------------------------------------------------------------]]
--
local merge_plugins = function(plugins)
	local merge_tb = vim.tbl_deep_extend
	local user_plugins = {
		-- Packer
		["wbthomason/packer.nvim"] = {
			cmd = require("core.lazy_load").packer_cmds, -- gotta fix this later
			config = function()
				require("plugins")
			end,
		},
		-- Plenary
		["nvim-lua/plenary.nvim"] = {
			module = "plenary",
		},
	}

	plugins = merge_tb("force", plugins, user_plugins)

	local final_table = {}

	for key, val in pairs(plugins) do
		if val and type(val) == "table" then
			plugins[key] = val.rm_default_opts and user_plugins[key] or plugins[key]
			plugins[key][1] = key
			final_table[#final_table + 1] = plugins[key]
		end
	end

	return final_table
end

-- Load all plugins
local present, packer = pcall(require, "packer")

if present then
	vim.cmd("packadd packer.nvim")

	-- Assemble table for packer syntax
	plugins = merge_plugins(plugins)

	-- load packer init options
	local init_options = require("plugins.configs.others").packer_init()

	packer.init(init_options)
	packer.startup({ plugins })
end
