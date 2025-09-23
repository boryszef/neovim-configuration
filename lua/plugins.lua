return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme dracula]])
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "pyright", "ruff", "rust_analyzer" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
	"neovim/nvim-lspconfig",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons"
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ["<C-x>"] = cmp.mapping.select_next_item(),
          ["<C-z>"] = cmp.mapping.select_prev_item(),
          ["<CR>"]  = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "vsnip" },
        },
      })
    end,
  },

  -- Signature hints
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        handler_opts = { border = "rounded" },
      })
    end,
  },

}

--local fn = vim.fn

-- Install your plugins here
--return packer.startup(function(use)

	-- Completion framework:
--	use 'hrsh7th/nvim-cmp' 

        -- LSP completion source:
--        use 'hrsh7th/cmp-nvim-lsp'

        -- Useful completion sources:
--        use 'hrsh7th/cmp-nvim-lua'
--        use 'hrsh7th/cmp-nvim-lsp-signature-help'
--        use 'hrsh7th/cmp-vsnip'                             
--        use 'hrsh7th/cmp-path'                              
--        use 'hrsh7th/cmp-buffer'                            
--        use 'hrsh7th/vim-vsnip'                             

	-- Bufferline (tabs for buffers)
--	use {
--		'akinsho/bufferline.nvim',
--		tag = "*",
--		requires = 'nvim-tree/nvim-web-devicons'
--	}

--end)


