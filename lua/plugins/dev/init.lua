return {
  {-- Mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    --lsp
    "neovim/nvim-lspconfig",
    "onsails/lspkind.nvim",
    "nvimdev/lspsaga.nvim",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
      {'ray-x/lsp_signature.nvim',
        event = "VeryLazy",
        opts = {},
        config = function() require("lsp_signature").setup({
            bind = true,
            handler_opts = {
            border = "rounded"
            },
            transparency = 1,
          })
          end
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  {
    --treesitter
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "RRethy/nvim-treesitter-endwise",
      "yioneko/nvim-yati",
      "windwp/nvim-ts-autotag",
      "HiPhish/nvim-ts-rainbow2"
    },
  },
  {
    --completion
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
  },
  {
    --refactoring
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }
  },
  {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { --Emmet, quickly expand code html, jsx, tsx
    'mattn/emmet-vim'
  },
  "AndrewRadev/tagalong.vim", 
}
