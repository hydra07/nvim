return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "evesdropper/luasnip-latex-snippets.nvim",
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "honza/vim-snippets",
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load()
          require("luasnip").filetype_extend("all", { "_" })
        end,
      },
    },
    build = "make install_jsregexp",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    -- keys = {
    --   {
    --     "<Tab>",
    --     function()
    --       return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<Tab>"
    --     end,
    --     expr = true, remap = true, silent = true, mode = "i",
    --   },
    --   { "<Tab>", function() require("luasnip").jump(1) end, mode = "s" },
    --   { "<S-Tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    -- },
    config = function(_, opts)
      require("luasnip").setup(opts)

      local snippets_folder = vim.fn.stdpath "config" .. "/lua/plugins/lsp/snippets/"
      require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }

      vim.api.nvim_create_user_command("LuaSnipEdit", function()
        require("luasnip.loaders.from_lua").edit_snippet_files()
      end, {})
    end,
  },
  'saadparwaiz1/cmp_luasnip',
  -- {
  --   "madskjeldgaard/cheeky-snippets.nvim",
  --   dependencies = {
  --     "L3MON4D3/LuaSnip",
  --   },
  --   config = function()
  --     local cheeky = require "cheeky"
  --     cheeky.setup {
  --       langs = {
  --         all = true,
  --         lua = true,
  --         cpp = true,
  --         asm = true,
  --         cmake = true,
  --         markdown = true,
  --         supercollider = true,
  --       },
  --     }
  --   end,
  -- },
}