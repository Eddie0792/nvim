local has = vim.fn.has
local is_win = has 'win32'
local is_unix = has 'unix'

if is_win then
  require 'config.win_opts'
else
  require 'config.unix_opts'
end

require 'config.lazy'
require 'config.mappings'
require 'config.autocmds'
