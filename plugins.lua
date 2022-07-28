return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

    -- -- THEMES --
	-- Gruvbox theme with integration with Treesitter
	-- use {
	-- 	"luisiacc/gruvbox-baby",
	-- 	config = "vim.cmd [[colorscheme gruvbox-baby]]"
	-- }

    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "mocha"
            require("catppuccin").setup{ transparent_background = true }
            vim.cmd [[colorscheme catppuccin]]
        end
    }
    --

    use {
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require "configs.telescope"
		end,
	}

	use {
		"stevearc/dressing.nvim",
		after = "telescope.nvim"
	}

	use "kyazdani42/nvim-web-devicons"

	use {
		"ojroques/nvim-hardline",
		config = function()
			require "hardline".setup{}
		end,
	}

	-- LSP & Completion Stuff
	use {
	    "neovim/nvim-lspconfig"
	}

	use({
	  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	  config = function()
	    require("lsp_lines").setup()
	  end,
	})

	use {
		"hrsh7th/nvim-cmp",
		requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lua" },
	}

	use { "onsails/lspkind.nvim", requires = "nvim-cmp" }

	use {
		"L3MON4D3/LuaSnip",
		requires = "nvim-cmp",
		config = function()
			require "configs/luasnip"
		end,
	}

	use {
		"saadparwaiz1/cmp_luasnip",
		requires = "LuaSnip"
	}

	use {
	  "zbirenbaum/copilot.lua",
	  event = {"VimEnter"},
	  config = function()
	    vim.defer_fn(function()
	      require("copilot").setup()
	    end, 100)
	  end,
	}
	use { "zbirenbaum/copilot-cmp", requires = "copilot.lua", module = "copilot_cmp" }

    -- Easy installation of LSPs and DAP Servers (the antedecent to lspconfig)
    use {
        "williamboman/mason.nvim",
        config = function()
            require "mason".setup{}
        end,
    }

    use {
        "williamboman/mason-lspconfig.nvim",
        requires = { "mason.nvim", "nvim-lspconfig" },
        config = function()
            require "mason-lspconfig".setup{}
        end,
    }

    -- Used for formatting
    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require "configs.null-ls"
        end,
    }

    -- UI Stuff

    -- Treesitter for better highlighting and improved movement
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = { 'windwp/nvim-ts-autotag', "windwp/nvim-autopairs"},
        config = function()
            require("configs/treesitter")
            require('nvim-treesitter.install')
            require("nvim-autopairs").setup{}
        end,
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("configs/indent-blankline")
        end,
    }

    use {
        "m-demare/hlargs.nvim",
        requires = "nvim-treesitter",
        config = function()
            require("hlargs").setup{}
        end,
    }

    -- Utilities
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'bufferline'.setup{ auto_hide = false } end,
    }

    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup{}
        end,
    }

    use {
        "brenoprata10/nvim-highlight-colors",
        config = function() require("nvim-highlight-colors").setup{} end,
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        requires = "MunifTanjim/nui.nvim",
    }
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup{}
      end,
    }
    
    use {
        "terrortylor/nvim-comment",
        config = function() require 'nvim_comment'.setup{} end,
    }

    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
    }

    use {"ellisonleao/glow.nvim"}
    use "kdheepak/lazygit.nvim"


end)
