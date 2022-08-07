local tsconfig = require 'nvim-treesitter.configs'
tsconfig.setup {
    ensure_installed = { 'c', 'lua', 'rust', 'html', 'javascript', 'css', 'python', 'latex', 'json', 'dockerfile',
        'cmake', 'make' },
    highlight = { enable = true },
    -- indent = { enable = true },
    autopairs = { enable = true },
    autotag = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<S-CR>",
            node_decremental = ";",
        }
    },
    additional_vim_regex_highlighting = true,
    context_commentstring = { -- NOTE: Assuming 'JoosepAlviste/nvim-ts-context-commentstring' is installed!
        enable = true
    }
}

print('Treesitter loaded')
