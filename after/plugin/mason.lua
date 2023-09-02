local mason = require("mason")
local lspconfig = require("mason-lspconfig")

mason.setup {
  ui = {
    icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
    }
}
}

lspconfig.setup {
  automatically_install = true,
  ensure_installed = {
    'tsserver',
    'lua_ls',
    'rust_analyzer',
    'pylsp',
    'pyright',
    'tailwindcss',
    'html',
    'cssls',
    'jsonls',
  },
}

