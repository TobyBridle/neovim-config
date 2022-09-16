local opts = {
  style = "night",
  transparent = true,
  italic_comments = true,
  -- italic_keywords = true,
  -- italic_functions = true,
  -- italic_variables = true,
}

require("tokyonight").setup(opts)

-- Loop opts and set them using vim.g.tokyonight_
-- for k, v in pairs(opts) do
--   vim.g["tokyonight_" .. k] = v
-- end
