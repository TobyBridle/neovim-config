local has_opts, user_opts = pcall(require, "core.custom")
if not has_opts then
  error "core.custom not found!"
end

if user_opts.cmd.colorscheme == "everblush" then
  local everblush = require "everblush"
  everblush.setup { transparent_background = true }
elseif user_opts.cmd.colorscheme == "gruvbox-baby" then
  vim.g.gruvbox_baby_use_original_palette = true
  vim.g.gruvbox_baby_transparent_mode = true
elseif user_opts.cmd.colorscheme == "oh-lucy" then
  vim.g.oh_lucy_transparent_background = 1
elseif user_opts.cmd.colorscheme == "oxocarbon-lua" then
  vim.g.oxocarbon_lua_transparent = true
end

vim.cmd("autocmd VimEnter * colorscheme " .. user_opts.cmd.colorscheme) -- Wait for plugins to load
