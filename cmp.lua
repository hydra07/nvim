return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "ray-x/cmp-treesitter",
      "lukas-reineke/cmp-rg",
      "lukas-reineke/cmp-under-comparator",
      -- { "tzachar/cmp-tabnine", build = "./install.sh", enabled = true },
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
    opts = function()
      -- vim.opt.completeopt = { "menuone", "noselect", "noinsert", "preview" }
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.shortmess = vim.opt.shortmess + { c = true }
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local neogen = require "neogen"
      local compare = require "cmp.config.compare"
      local types = require "cmp.types"
      local lspkind = require "lspkind"
      local source_mapping = {
        nvim_lsp = "(Lsp)",
        luasnip = "(Snip)",
        buffer = "(Buffer)",
        nvim_lua = "(Lua)",
        treesitter = "(Tree)",
        path = "(Path)",
        rg = "(Rg)",
        nvim_lsp_signature_help = "(Sig)",
        -- cmp_tabnine = "(TNine)",
        ["vim-dadbod-completion"] = "(DB)",
      }

      local duplicates = {
        buffer = 1,
        path = 1,
        nvim_lsp = 0,
        luasnip = 1,
      }

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      local select_opts = { behavior = cmp.SelectBehavior.Select }

      return {
        performance = { debounce = 40, throttle = 40, fetching_timeout = 300 },
        sorting = {
          priority_weight = 2,
          comparators = {
            compare.score,
            compare.offset,
            compare.exact,
            require("cmp-under-comparator").under,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          
        },
        sources = {
          
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, item)
            local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 40 }(entry, item)
            local source = entry.source.name
            local menu = source_mapping[source]
            local duplicates_default = 0
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "
            kind.menu = menu
            -- if source == "cmp_tabnine" then
            --   if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            --     menu = entry.completion_item.data.detail .. " " .. menu
            --   end
            --   kind.kind = "  "
            -- end
            if source == "treesitter" then
              kind.kind = " 󰐅 "
            end
            local max_width = 80
            if max_width ~= 0 and #kind.abbr > max_width then
              kind.abbr = string.sub(kind.abbr, 1, max_width - 1) .. ""
            end
            kind.dup = duplicates[entry.source.name] or duplicates_default
            return kind
          end,
        },
        window = {
          completion = cmp.config.window.bordered {
            border = "none",
            side_padding = 0,
            col_offset = -3,
          },
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
          },
        },
      }
    end,
    config = function(_, opts)
      local cmp = require "cmp"
      cmp.setup(opts)
      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
        sources = cmp.config.sources({
          { name = "vim-dadbod-completion" },
        }, {
          { name = "buffer" },
        }),
      })

      -- -- TabNine
      -- local tabnine = require "cmp_tabnine.config"
      -- tabnine:setup {
      --   max_lines = 1000,
      --   max_num_results = 20,
      --   sort = true,
      --   run_on_every_keystroke = true,
      --   snippet_placeholder = "..",
      --   ignored_file_types = { -- default is not to ignore
      --     -- uncomment to ignore in lua:
      --     -- lua = true
      --   },
      -- }

      -- Auto pairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end,
  },
  
  
}
