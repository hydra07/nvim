-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
snippet = {
  expand = function(args)
    luasnip.lsp_expand(args.body)
  end,
},
mapping = cmp.mapping.preset.insert {
  ['<C-j>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-b>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },

  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { 
      name = "html-css",
      option = {
        max_count = {}, -- not ready yet

        enable_on = {
            "html",
            "js",
            "jsx",
            "vue"

        }, -- set the file types you want the plugin to work on
        file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
        style_sheets = {
          -- example of remote styles, only css no js for now
          "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
          -- "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
        }
      }
    },
    { name = "nvim_lua" },
    { name = "path" },
  },
  window = {
    completion = cmp.config.window.bordered{
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      -- side_padding = -999,
      col_offset = 0
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      -- winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
    }
  }
}
--
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
