-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.loader then
  vim.loader.enable()
end
require("config.lazy")
if vim.g.neovide then
  require("config.neovide")
end
