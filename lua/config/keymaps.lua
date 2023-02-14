-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Change Windows
vim.keymap.set("n", "<UP>", "<C-w>k", {})
vim.keymap.set("n", "<LEFT>", "<C-w>h", {})
vim.keymap.set("n", "<DOWN>", "<C-w>j", {})
vim.keymap.set("n", "<RIGHT>", "<C-w>l", {})
