local lspconfig = require "lspconfig"
local wk = require "which-key"
local register_wk = function(lhs, rhs, desc, group, group_desc, prefix)
  wk.register({
    [group] = {
      name = group_desc,
      [lhs] = { rhs, desc },
    },
  }, { buffer = 0, prefix = prefix or "" })
end

local has_opts, user_opts = pcall(require, "core.custom")
if not has_opts then
  error "core.custom not found!"
end

if user_opts.lsp.use_lsp_lines == true then
  vim.diagnostic.config { virtual_text = false } -- Turn off to prevent collision with LSP Lines
  require("lsp_lines").setup {}
end

-- Setup lspconfig.
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local loaded_capabilites, capabilities = pcall(require, "cmp_nvim_lsp")
if loaded_capabilities then
  capabilities.update_capabilities(lsp_capabilities)
end

local servers = {
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
}
local settings = { sumneko_lua = { Lua = { diagnostics = { globals = { "vim", "nvim" } } } } }
local cmd = {
  omnisharp = {
    "/opt/homebrew/bin/omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid()),
  },
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    -- Check if server is clangd
    on_attach = function(client)
      if client.supports_method "textDocument/formatting" then
        client.server_capabilities.documentFormattingProvider = false
      end
      register_wk("K", vim.lsp.buf.hover, "Show docs for keyword", "", "LSP")
      register_wk("d", vim.lsp.buf.definition, "Goto definition", "g", "LSP")
      register_wk("T", vim.lsp.buf.type_definition, "Goto type definition", "g", "LSP")
      register_wk("i", vim.lsp.buf.implementation, "Goto implementation", "g", "LSP")
      register_wk("r", "<CMD>Telescope lsp_references<CR>", "Show references", "g", "LSP")

      register_wk("r", vim.lsp.buf.rename, "Rename using LSP", "l", "LSP Utils", "<Leader>")
      register_wk("a", vim.lsp.buf.code_action, "Explore code actions", "l", "LSP Utils", "<Leader>")
      register_wk("o", "<CMD>SymbolsOutline<CR>", "Explore code outline", "l", "LSP Utils", "<Leader>")

      register_wk(
        "l",
        "<CMD>Telescope diagnostics<CR>",
        "Show diagnostics in Telescope",
        "d",
        "Diagnostics",
        "<Leader>"
      )
      register_wk(
        "t",
        "<CMD>TroubleToggle document_diagnostics<CR>",
        "Show diagnostics in Trouble",
        "d",
        "Diagnostics",
        "<Leader>"
      )
      register_wk("j", vim.diagnostic.goto_next, "Goto next error in code", "d", "Diagnostics", "<Leader>")
      register_wk("k", vim.diagnostic.goto_prev, "Goto previous error in code", "d", "Diagnostics", "<Leader>")
    end,
    cmd = cmd[server] or nil,
    settings = settings[server] or {},
  }
end

-- Change Signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
