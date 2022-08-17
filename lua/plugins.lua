-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.o.runtimepath = vim.fn.stdpath "data" .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

local has_packer, packer = pcall(require, "packer")
if not has_packer then
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use {
    "lewis6991/impatient.nvim",
    config = function()
      _G.__luacache_config = {
        chunks = {
          enable = true,
          path = vim.fn.stdpath "cache" .. "/luacache_chunks",
        },
        modpaths = {
          enable = true,
          path = vim.fn.stdpath "cache" .. "/luacache_modpaths",
        },
      }
      require "impatient"
    end,
  }

  -- -- THEMES --
  -- Gruvbox theme with integration with Treesitter

  use {
    "luisiacc/gruvbox-baby",
  }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha"
      require("catppuccin").setup { transparent_background = true }
    end,
  }
  --
  use {
    "folke/tokyonight.nvim",
    config = function()
      require "colors.tokyonight"
    end,
  }

  use {
    "projekt0n/github-nvim-theme",
    config = function()
      require "colors.github"
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require "configs.telescope"
    end,
  }

  use {
    "stevearc/dressing.nvim",
    -- after = "telescope.nvim",
    event = "UIEnter",
  }

  use "kyazdani42/nvim-web-devicons"

  -- LSP: & Completion Stuff
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lsp"
    end,
  }

  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  }

  use {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    requires = {
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "windwp/nvim-autopairs" },
    },
    config = function()
      require "configs.cmp"
    end,
  }

  use { "onsails/lspkind.nvim", requires = "nvim-cmp" }

  use {
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
    requires = "nvim-cmp",
    config = function()
      require "configs/luasnip"
    end,
  }

  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip",
    requires = "LuaSnip",
  }

  use {
    "rafamadriz/friendly-snippets",
  }

  use {
    "zbirenbaum/copilot.lua",
    -- event = { "VimEnter" },
    after = "nvim-cmp",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }
  use { "zbirenbaum/copilot-cmp", requires = "copilot.lua", module = "copilot_cmp", after = "copilot.lua" }

  -- Easy installation of LSPs and DAP Servers (the antedecent to lspconfig)
  use {
    "williamboman/mason.nvim",
    cmds = require("core.lazy_cmds").mason_cmds,
    config = function()
      require("mason").setup {}
    end,
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    requires = { "mason.nvim", "nvim-lspconfig" },
    after = { "mason.nvim", "nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup {}
    end,
  }

  -- Used for formatting
  use {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    config = function()
      require "configs.null-ls"
    end,
  }

  -- UI Stuff

  use {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  }
  use {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup {}
    end,
  }

  -- Treesitter for better highlighting and improved movement
  use {
    "nvim-treesitter/nvim-treesitter",
    -- cmd = require("core.lazy_cmds").treesitter_cmds,
    requires = {
      { "windwp/nvim-ts-autotag", after = "nvim-cmp" },
      { "windwp/nvim-autopairs", after = "nvim-cmp" },
    },
    config = function()
      require "configs/treesitter"
      require "nvim-treesitter.install"
      require("nvim-autopairs").setup {}
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = { "nvim-treesitter" },
    after = "nvim-treesitter",
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "UIEnter",
    config = function()
      require "configs/indent-blankline"
    end,
  }

  use {
    "m-demare/hlargs.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
    event = "InsertEnter",
    config = function()
      require("hlargs").setup {}
    end,
  }

  use {
    "ziontee113/syntax-tree-surfer",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
      require("syntax-tree-surfer").setup {}
    end,
  }

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  -- use {
  --     "simrat39/rust-tools.nvim",
  --     config = function ()
  --         require("rust-tools").setup{}
  --     end,
  -- }

  -- Utilities
  -- use {
  --   "romgrk/barbar.nvim",
  --   requires = { "kyazdani42/nvim-web-devicons" },
  --   config = function()
  --     require("bufferline").setup { auto_hide = false }
  --   end,
  -- }
  --
  use {
    "akinsho/bufferline.nvim",
    event = "UIEnter",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup { always_show_bufferline = true }
    end,
  }

  use {
    "ojroques/nvim-hardline",
    config = function()
      require("hardline").setup {}
    end,
  }

  use {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup {}
    end,
  }

  use {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup {}
    end,
  }

  use {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {}
    end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  }

  use {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup {}
    end,
  }

  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  }

  use {
    "danymat/neogen",
    config = function()
      require("neogen").setup {}
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  }

  use { "ellisonleao/glow.nvim" }
  use "kdheepak/lazygit.nvim"

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        keywords = {
          HELP = { icon = "ﲉ", color = "warning" },
          CHANGE = { icon = "", color = "error" },
        },
      }
    end,
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end,
  }

  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {}
    end,
  }

  use {
    "simrat39/symbols-outline.nvim",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  }

  use {
    "numToStr/FTerm.nvim",
    config = function()
      require("FTerm").setup {}
    end,
  }

  -- NOTE: Local in-buffer navigation
  use {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      require("which-key").register { ["\\"] = { "<CMD>HopWord<CR>", "Quick navigation using Hop" } }
    end,
  }
  -- NOTE: Between buffers navigation
  use {
    "ThePrimeagen/harpoon",
    requires = "plenary.nvim",
    config = function()
      require "configs.harpoon"
    end,
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
