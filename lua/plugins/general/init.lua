return {
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    --terminal
    'akinsho/toggleterm.nvim', version = "*", config = true
  },
  {
    --telescope
    "nvim-telescope/telescope.nvim",
    keys = keys,
    config = setup,
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "natecraddock/telescope-zf-native.nvim",
      "prochri/telescope-all-recent.nvim",
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "kkharji/sqlite.lua" },
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
  },
  {
    "LukasPietzschmann/telescope-tabs",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = true,
  },
  {--which key
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,  
  },
  {
    --autopairs
    "windwp/nvim-autopairs",
    opts = {
      check_ts = true,
    },
  },
  {
    --comment
    "numToStr/Comment.nvim",
    keys = { { "gcc" }, { "gco" }, { "gcO" }, { "gcA" }, { "gbc" }, { "gc", mode = "v" }, { "gb", mode = "v" } },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  -- {
  --   "AckslD/muren.nvim",
  --   keys = {
  --     {
  --       "<r",
  --       ":MurenToggle<CR>",
  --     },
  --     toggle_side = 's<Tab>',
  --     toggle_options_focus = '<C-s>',
  --     toggle_option_under_cursor = '<CR>',
  --   },
  --   config = function()
  --     require("muren").setup()
  --   end,
  -- },
  -- {
  --   "cshuaimin/ssr.nvim",
  --   name = "ssr",
  --   keys = {
  --     {
  --       mode = { "n", "x" },
  --       ",r",
  --       function()
  --         require("ssr").open()
  --       end,
  --     },
  --   },
  --   opts = {
  --     min_width = 50,
  --     min_height = 5,
  --     keymaps = {
  --       close = "q",
  --       next_match = "n",
  --       prev_match = "N",
  --       replace_all = "<leader><cr>",
  --     },
  --   },
  -- },
  -- "machakann/vim-highlightedyank",
  -- "ggandor/lightspeed.nvim",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
   },
}
