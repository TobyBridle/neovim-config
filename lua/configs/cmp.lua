vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Setup nvim-cmp.
local cmp = require "cmp"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local lspkind = require "lspkind"

cmp.setup {
  formatting = {
    format = lspkind.cmp_format {
      mode = "symbol_text", -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-k>"] = cmp.mapping(function(cb)
      if require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        require("luasnip").jump()
        cb()
      end
    end),
  },
  experimental = { ghost_text = true },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    -- { name = "copilot" },
    { name = "luasnip" }, -- For luasnip users.
  }, {
    { name = "buffer", keyword_length = 4 },
  }),
}

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
