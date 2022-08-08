require "core.opts"
require "core.mappings"
require "core.autocmds"

-- Disable Netrw vim.g.loaded_netrwPlugin = 1
vim.g.termguicolors = true -- Use 24bit Colours (only works if the terminal supports it)
vim.o.laststatus = 3 -- Global Statusline
