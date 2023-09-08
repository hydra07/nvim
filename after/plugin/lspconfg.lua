local lspconfig = require('lspconfig')
local cmp = require('cmp')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
-- local neodev = require('neodev')

local capabilities = cmp_nvim_lsp.default_capabilities() 

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css", "vue" },
})
--neodev
-- neodev.setup({
--   override = function(root_dir, library)
--     if root_dir:find("/etc/nixos", 1, true) == 1 then
--       library.enabled = true
--       library.plugins = true
--     end
--   end,
-- })

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})