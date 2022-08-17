local tsconfig = require "nvim-treesitter.configs"
tsconfig.setup {
  ensure_installed = {
    "c",
    "lua",
    "rust",
    "html",
    "javascript",
    "css",
    "python",
    "latex",
    "json",
    "dockerfile",
    "cmake",
    "make",
  },
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
    },
  },
  additional_vim_regex_highlighting = true,
  context_commentstring = { -- NOTE: Assuming 'JoosepAlviste/nvim-ts-context-commentstring' is installed!
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["as"] = "@switch.outer",
        ["is"] = "@switch.inner",
      },
    },
  },
}
