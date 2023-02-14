return {
  "numToStr/FTerm.nvim",
  keys = {
    {
      "<Leader>t",
      "<CMD>lua require 'FTerm'.toggle()<CR>",
      desc = "Open the Terminal",
      "n",
    },
    {
      "<C-h>",
      "<CMD>lua require 'FTerm'.toggle()<CR>",
      desc = "Hide the Terminal",
      mode = "t",
    },
    {
      "<C-d>",
      "<CMD>lua require 'FTerm'.exit()<CR>",
      desc = "Destroy the Terminal",
      mode = "t",
    },
  },
}
