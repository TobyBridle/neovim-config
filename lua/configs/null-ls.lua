local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local linting = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup {
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  sources = {
    formatting.prettierd,
    formatting.stylua,
    formatting.rustfmt,
    formatting.csharpier,
    formatting.clang_format,
  },
}
