--[[----------------------------------------------------------------------------
                                  Plugin Table
-------------------------------------------------------------------------------
]]
--
local M = require("core.utils")

local plugins = {
  -- Impatient
  ["lewis6991/impatient.nvim"] = {},

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


--  ["jose-elias-alvarez/null-ls.nvim"] = {
--    after = "nvim-lspconfig",
--    config = function()
--      require("plugins.configs.null-ls")
--    end,
--  },

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

  -- Theme
  ["rose-pine/neovim"] = {
    as = "rose-pine",
    config = function()
      require('plugins.configs.rose-pine')
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
-- Load all plugins
local present, packer = pcall(require, "packer")

if present then
  vim.cmd("packadd packer.nvim")

  -- Assemble table for packer syntax
  plugins = M.merge_plugins(plugins)

  -- load packer init options
  local init_options = require("plugins.configs.others").packer_init()

  packer.init(init_options)
  packer.startup({ plugins })
end
