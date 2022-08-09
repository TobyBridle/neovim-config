require "core.opts"
vim.defer_fn(function()
  require "core.mappings"
end, 0)

require "core.autocmds"
require "colors"
