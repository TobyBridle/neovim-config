local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  print "Couldn't load Mason!"
  return
end

local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
  print "Couldn't load Mason LSP Config!"
  return
end

local base_opts = {
  on_attach = require("configs.lsp.handlers").on_attach,
  capabilities = require("configs.lsp.handlers").capabilities,
}

mason.setup {}
mason_lsp.setup {
  ensure_installed = {
    "sumneko_lua",
    "rust_analyzer",
    "taplo",
    "clangd",
    "cmake",
    "emmet_ls",
    "jsonls",
    "pyright",
    "tsserver",
    "cmake",
    "html",
    "omnisharp",
    "jdtls",
    "haskell-language-server",
  },
}

mason_lsp.setup_handlers {
  function(server_name)
    local opts = base_opts
    local has_settings, settings = pcall(require, "configs.lsp.settings." .. server_name)
    if has_settings then
      opts = vim.tbl_deep_extend("force", opts, settings)
    end
    require("lspconfig")[server_name].setup(opts)
  end,
}
