
local cmp = require("cmp")
local luasnip = require ("luasnip")
local lspkind = require("lspkind")
local ts = require("nvim-treesitter")
local duplicates = {
  buffer = 1,
  path = 1,
  nvim_lsp = 0,
  luasnip = 1,
}
local source_mapping = {
  nvim_lsp = "[Lsp]",
  luasnip = "[Snip]",
  buffer = "[Buffer]",
  nvim_lua = "[Lua]",
  treesitter = "[Tree]",
  path = "[Path]",
  rg = "[Rg]",
  nvim_lsp_signature_help = "[Sig]",
  ["vim-dadbod-completion"] = "[DB]",
}
cmp.setup({
  formatting = {
    fields = {"kind","abbr","menu"},
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      -- vim_item.kind = string.sub(vim_item.kind, 1, 1)
      vim_item.menu = source_mapping[entry.source.name]
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
    ["<Down>"] = cmp.mapping.select_next_item(select_opts),
    ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
    ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = cmp.mapping(function(fallback)
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line_text = vim.fn.getline(line)
      
      if col == 0 or string.match(line_text, "^[ \t]*$") then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
      elseif cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        cmp.complete()
      end
    end, { "i", "s", "c" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp", group_index = 1, keyword_length = 1 },
    { name = "luasnip", group_index = 1, keyword_length = 2 },
    { name = "treesitter", group_index = 1, keyword_length = 3 },
    { name = "buffer", group_index = 2, keyword_length = 3 },
    { name = "rg", group_index = 2, keyword_length = 3 },
    { name = "path", group_index = 3 },
    { name = "nvim_lua", group_index = 3 },
    { name = "neorg", group_index = 3 },
    { name = "nvim_lsp_signature_help" },
  }),
  window = {
    completion = cmp.config.window.bordered {
      -- border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
      border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
      side_padding = 0,
      col_offset = -3,
    },
    documentation = {
      -- border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
    },
  }
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})

 cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

