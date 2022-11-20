-- Build / Execute Keymaps
local wk = require "which-key"
local langs = {
  c = { build = "gcc -o %f %f", exec = "./%f" },
  rust = { build = "rustc %f", exec = "cargo run" },
  python = { exec = "python3 %f" },
  make = { exec = "make" },
}

-- Only use Relative Number in Normal Mode
vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })

vim.api.nvim_create_autocmd("TextYankPost", {
  command = "lua vim.highlight.on_yank({higroup = 'IncSearch', timeout = 50})",
  pattern = "*",
})
