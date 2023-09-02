local lspsaga = require("lspsaga")
-- local finder = require("lspsaga.finder")
-- finder.setup {
--   finder_action_keys = {
--     open = 'o',  -- Mở tệp hoặc thư mục
--     vsplit = 'v',  -- Mở trong cửa sổ dọc
--     split = 's',  -- Mở trong cửa sổ ngang
--     quit = '<Esc>',  -- Thoát khỏi Finder
--     scroll_down = '<C-f>',  -- Cuộn xuống
--     scroll_up = '<C-b>',  -- Cuộn lên
-- }
-- }

lspsaga.setup {
  implement = {
    sign = false,
    virtual_text = true 
  },
  finder = {
    max_height = 0.6,
    keys = {
      vsplit = 'v'
    },
  },
  ui = {
    border = 'rounded',
  },
  symbol_in_winbar = {
    enable = true
  },
  lightbulb = {
    enable = false
  },
  outline = {
    layout = 'float'
  }
}