--
-- $HOME/.config/nvim/lua/config/mason.lua
--
--
if true then
  return {}
end
--
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash - language - server",
        "black",
        "css - lsp",
        "eslint - lsp",
        "eslint_d",
        "html - lsp",
        "json - lsp",
        "jsonlint",
        "lua - language - server",
        "markdown - toc",
        "markdownlint - cli2",
        "marksman",
        "prettier",
        "pyright",
        "python - lsp - server",
        "ruff",
        "shellcheck",
        "shfmt",
        "sql - formatter",
        "sqlfluff",
        "sqlls",
        "stylelint",
        "stylua",
        "typescript - language - server",
        "vtsls",
        "yaml - language - server",
        "yamllint",
      },
    },
  },
}
