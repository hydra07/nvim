local mason = require("mason")
local lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

mason.setup {
  ensure_installed = {
    "pyright","black","flake8" --for python
  },
  ui = {
    icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
    }
  }
}

mason_null_ls.setup {
  ensure_installed = {
    "prettierd",
    "stylua",
    "black",
    "ruff",
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

