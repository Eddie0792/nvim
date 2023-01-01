local M = {}
local merge_tb = vim.tbl_deep_extend

M.load_config = function()
	local config = require('core.default_config')
	return config


M.merge_plugins = function(plugins)
	local plugin_configs = require('core.default_config')
	local plugin_configs = M.load_config().plugins
	local user_plugins = plugin_configs
end


M.load_override = function(options_table, name)
	local plugin_configs, plugin_options = M.load_config().plugins, nil


return M
