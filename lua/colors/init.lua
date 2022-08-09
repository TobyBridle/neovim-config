local has_opts, user_opts = pcall(require, "core.custom")
if not has_opts then
  error "core.custom not found!"
end

vim.cmd("autocmd VimEnter * colorscheme " .. user_opts.cmd.colorscheme) -- Wait for plugins to load