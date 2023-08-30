return {
  {-- Mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  {
    --lsp
    "neovim/nvim-lspconfig",
    "onsails/lspkind.nvim",
  },

  {
    --completion
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    -- For vsnip users.
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    -- For luasnip users.
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- For ultisnips users.
    -- 'SirVer/ultisnips',
    -- 'quangnguyen30192/cmp-nvim-ultisnips',

    -- For snippy users.
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',

  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "danymat/neogen", 
    dependencies = "nvim-treesitter/nvim-treesitter", 
    config = true,
  },
  { "folke/neodev.nvim", opts = {} },
  {
    --treesitter
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "RRethy/nvim-treesitter-endwise",
      "yioneko/nvim-yati",
      "windwp/nvim-ts-autotag",
    },
  },
}