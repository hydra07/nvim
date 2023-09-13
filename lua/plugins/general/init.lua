return {
  {'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    --terminal
    'akinsho/toggleterm.nvim', config = true
  },
  {
    --telescope
    "nvim-telescope/telescope.nvim",
    -- keys = keys,
    -- config = setup,
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
  {
    --highlight comment
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {
        -- signs = true,
        -- highlight = {
        --   before = "", -- "fg" or "bg" or empty
        --   keyword = "bg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        --   after = "fg", -- "fg" or "bg" or empty
        --   pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
        --   comments_only = true, -- uses treesitter to match keywords in comments only
        --   max_line_len = 400, -- ignore lines longer than this
        --   exclude = {}, -- list of file types to exclude highlighting
        -- },
      }
    end,
  },
  "machakann/vim-highlightedyank",
  "kylechui/nvim-surround",
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
