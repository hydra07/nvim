return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        -- prettier
        nls.builtins.formatting.prettier,
        --for python
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort,
        nls.builtins.diagnostics.pylint,
        nls.builtins.diagnostics.flake8,
        --for fish
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        --for ts/js
        nls.builtins.diagnostics.eslint_d,
        --for html
        -- nls.builtins.diagnostics.stylelint,
        --for rust
        nls.builtins.formatting.rustfmt,

        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,

      },
    }
  end,
}