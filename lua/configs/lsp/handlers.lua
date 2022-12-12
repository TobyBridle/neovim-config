local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  print "Something went wrong with Which-Key!"
  return
end

local register_wk = function(lhs, rhs, desc, group, group_desc, prefix)
  wk.register({
    [group] = {
      name = group_desc,
      [lhs] = { rhs, desc },
    },
  }, { buffer = 0, prefix = prefix or "" })
end

local M = {}

M.on_attach = function(client, bufnr)
  -- NOTE: We want to disable this since we are using null-ls for formatting.
  if client.supports_method "textDocument/formatting" then
    client.server_capabilities.documentFormattingProvider = false
  end

  -- Only setup once
  if pcall(function()
    return vim.api.nvim_buf_get_var(bufnr, "UserLspAttached") == 1
  end) then
    return
  end
  vim.api.nvim_buf_set_var(bufnr, "UserLspAttached", 1)

  register_wk("K", vim.lsp.buf.hover, "Show docs for keyword", "", "LSP")
  register_wk("d", vim.lsp.buf.definition, "Goto definition", "g", "LSP")
  register_wk("T", vim.lsp.buf.type_definition, "Goto type definition", "g", "LSP")
  register_wk("i", "<CMD>Telescope lsp_implentations<CR>", "Goto implementations", "g", "LSP")
  register_wk("r", "<CMD>Telescope lsp_references<CR>", "Show references", "g", "LSP")

  register_wk("r", vim.lsp.buf.rename, "Rename using LSP", "l", "LSP Utils", "<Leader>")
  register_wk("a", vim.lsp.buf.code_action, "Explore code actions", "l", "LSP Utils", "<Leader>")
  register_wk("o", "<CMD>SymbolsOutline<CR>", "Explore code outline", "l", "LSP Utils", "<Leader>")
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
else
  print "Couldn't load 'cmp_nvim_lsp' nor update capabilities"
end

M.capabilities.offsetEncoding = { "utf-16" }

return M
