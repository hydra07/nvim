local cmp = require("cmp")
local luasnip = require ("luasnip")
local neogen = require ("neogen")
local compare = require ("cmp.config.compare")
local types = require ("cmp.types")
local lspkind = require("lspkind")
local duplicates = {
  buffer = 1,
  path = 1,
  nvim_lsp = 0,
  luasnip = 1,
}
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
cmp.setup({
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 40 }(entry, item)
      local source = entry.source.name
      local menu = source_mapping[source]
      local duplicates_default = 0
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = strings[1] .. " " -- Đảo ngược vị trí của văn bản và biểu tượng
      kind.menu = menu
      -- if source == "cmp_tabnine" then
      --   if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
      --     menu = entry.completion_item.data.detail .. " " .. menu
      --   end
      --   kind.kind = "  "
      -- end
      if source == "treesitter" then
        kind.kind = "󰐅 " -- Giữ biểu tượng trước văn bản
      end
      local max_width = 80
      if max_width ~= 0 and #kind.abbr > max_width then
        kind.abbr = string.sub(kind.abbr, 1, max_width - 1) .. ""
      end
      kind.dup = duplicates[entry.source.name] or duplicates_default
      return kind
    end,
  },
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
    ["<Down>"] = cmp.mapping.select_next_item(select_opts),
    ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
    ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    -- ["<CR>"] = cmp.mapping {
    --   i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
    --   c = function(fallback)
    --     if cmp.visible() then
    --       cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
    --     else
    --       fallback()
    --     end
    --   end,
    -- },
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line_text = vim.fn.getline(line)
      
      if col == 0 or string.match(line_text, "^[ \t]*$") then
        -- Thực hiện nhập Tab bình thường
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
      elseif cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif neogen.jumpable() then
        neogen.jump_next()
      else
        cmp.complete()
      end
    end, { "i", "s", "c" }),
    

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif neogen.jumpable(true) then
        neogen.jump_prev()
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp", group_index = 1, keyword_length = 1 },
    { name = "luasnip", group_index = 1, keyword_length = 2 },
    -- { name = "cmp_tabnine", group_index = 1, keyword_length = 3 },
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
      border = "none",
      side_padding = 0,
      col_offset = -3,
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
    },
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
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

