local has_opts, user_opts = pcall(require, "core.custom")
if not has_opts then
  error "core.custom not found!"
end

vim.cmd("autocmd VimEnter * colorscheme " .. user_opts.colorscheme.theme) -- Wait for plugins to load
if user_opts.colorscheme.transparent == true then
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
