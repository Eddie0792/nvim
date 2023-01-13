local M = {}

M.load_config = function()
	local config = require('core.default_config')
	return config
end

M.load_override = function(options_table, name)
  local plugin_configs, plugin_options = M.load_config().plugins, nil
end

M.merge_plugins = function(plugins)
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



--M.merge_plugins = function(plugins)
--  local plugin_configs = require('core.default_config')
--  local plugin_configs = M.load_config().plugins
--  local user_plugins = plugin_configs
--end


return M
