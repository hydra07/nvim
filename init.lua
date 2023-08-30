vim.loader.enable()
-- Define leader key
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins").setup()
require("config.options")
require("config.map")
-- require("after")
if vim.g.neovide then
  require("config.neovide")
end