local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require "configs.lsp.mason"
require "configs.lsp.handlers"

local has_opts, user_opts = pcall(require, "core.custom")
if not has_opts then
  error "core.custom not found!"
end

if user_opts.lsp.use_lsp_lines == true then
  vim.diagnostic.config { virtual_text = false } -- Turn off to prevent collision with LSP Lines
  require("lsp_lines").setup {}
end
