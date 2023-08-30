local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local M = {}
function M.setup()
  if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  end
  vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

  require("lazy").setup({
    spec = {
      {import = "plugins.ui"},
      {import = "plugins.dev"},
      {import = "plugins.general"},
    },
    -- install = { colorscheme = { "tokyonight", "habamax" } },
    -- checker = { enabled = true }, -- automatically check for plugin updates

    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          -- "matchit",
          -- "matchparen",
          -- "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  })
end

return M