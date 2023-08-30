local mason = require("mason")
local lspconfig = require("mason-lspconfig")

mason.setup {
  ensure_installed = {
    'tsserver',
    'lua_ls',
    'rust_analyzer',
    'pylsp',
    'pyright',
    'tailwindcss',
    'html'
  }
}

lspconfig.setup {
  automatically_install = true,
}

