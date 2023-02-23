return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "lewis6991/gitsigns.nvim", "ThePrimeagen/refactoring.nvim" },
  opts = function(_, opts)
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.code_actions.gitsigns,
        nls.builtins.code_actions.refactoring,
      },
    }
  end,
}
