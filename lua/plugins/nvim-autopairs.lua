return {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("nvim-autopairs").setup()
  end,
}
