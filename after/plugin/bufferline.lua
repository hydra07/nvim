local buffer = require("bufferline")

buffer.setup{
  options = {
    separator_style = 'slope',
    diagnostics = {
      error = '',
      warning = '',
      information = '',
      hint = '',
      separator = '➜',
      icon = '',
      sources = {
        nvim_lsp = true,
        nvim_lua = true,
        path = true,
        treesitter = true,
      },
      symbols = {
        error = '',
        warning = '',
        information = '',
        hint = '',
      },
    },
    diagnostics_update_in_insert = false,
    show_duplicate_prefix = false,
    show_tab_indicators = true,
    show_buffer_close_icons = false,
    show_buffer_icons = true,
  },
}
