local opts = {
  noremap = true, silent = true, expr = false,
}

return {
  "ThePrimeagen/refactoring.nvim",

  keys = {
    {
      "<Leader>re",
      "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
      desc = "Extract Function",
      mode = "v",
      opts,
    },
    {
      "<Leader>rE",
      "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
      desc = "Extract Function to File",
      mode = "v",
      opts,
    },
    {
      "<Leader>rv",
      "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
      desc = "Extract Variable",
      mode = "v",
      opts,
    },
    {
      "<Leader>ri",
      "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
      desc = "Inline Variable",
      mode = "v",
      opts,
    },
    {
      "<Leader>rb",
      "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
      desc = "Extract Block",
      opts,
    },
    {
      "<Leader>rB",
      "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
      desc = "Extract Block to File",
      opts,
    },
  },
}
