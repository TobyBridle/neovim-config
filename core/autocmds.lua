-- Build / Execute Keymaps
local wk = require 'which-key'
local langs = {
    c = { build = "gcc -o %f %f", exec = "./%f", },
    rust = { build = "rustc %f", exec = "cargo run", },
    python = { exec = "python3 %f", },
    make = { exec = "make", },
}

for lang, data in pairs(langs) do
    -- if data.build ~= nil then
    --     vim.api.nvim_create_autocmd(
    --         "FileType",
    --         { command = wk.register({ b = { ":!" .. data.build .. "<CR>" } }, { prefix = "<Leader>" }), pattern = lang }
    --     )
    -- end
    vim.api.nvim_create_autocmd(
        "FileType",
        { command = "<CMD>lua require'which-key'.register({ e = { ':split<CR>:terminal '" ..
            data.exec .. "'<CR>' } }, { prefix = '<Leader>' })<CR>",
            pattern = lang }
    )
end

-- Only use Relative Number in Normal Mode
vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })

-- Formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    command = "lua vim.lsp.buf.formatting_sync(nil, 1000)",
    pattern = "*.cpp,*.css,*.go,*.h,*.html,*.js,*.json,*.jsx,*.lua,*.md,*.py,*.rs,*.ts,*.tsx,*.yaml",
})
