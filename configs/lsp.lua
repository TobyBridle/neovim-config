local lspconfig = require("lspconfig")
local wk = require("which-key")
local register_wk = function (lhs, rhs, desc, group, group_desc, prefix)
    wk.register({
        [group] = {
            name = group_desc,
            [lhs] = { rhs, desc},
        }
    }, { buffer = 0, prefix = prefix or ""})
end

vim.diagnostic.config({ virtual_text = false })
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { "sumneko_lua", "rust_analyzer", "clangd", "cmake", "emmet_ls", "jsonls", "pyright", "tsserver", "cmake"}
local settings = { sumneko_lua = { Lua = { diagnostics = { globals = { "vim", "nvim" } }}}}

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities,
        on_attach = function()
            register_wk("K", vim.lsp.buf.hover, "Show docs for keyword", "", "LSP")
            register_wk("d", vim.lsp.buf.definition, "Goto definition", "g", "LSP")
            register_wk("T", vim.lsp.buf.type_definition, "Goto type definition", "g", "LSP")
            register_wk("i", vim.lsp.buf.implementation, "Goto implementation", "g", "LSP")
            register_wk("r", "<CMD>Telescope lsp_references<CR>", "Show references", "g", "LSP")
            register_wk("r", vim.lsp.buf.rename, "Rename using LSP", "l", "LSP Utils", "<Leader>")

            register_wk("l", "<CMD>Telescope diagnostics<CR>", "Show diagnostics in Telescope", "d", "Diagnostics", "<Leader>")
            register_wk("j", vim.diagnostic.goto_next, "Goto next error in code", "d", "Diagnostics", "<Leader>")
            register_wk("k", vim.diagnostic.goto_prev, "Goto previous error in code", "d", "Diagnostics", "<Leader>")
        end,
        -- Check if server has an entry in settings
        settings = settings[server] or {},
    }
end
