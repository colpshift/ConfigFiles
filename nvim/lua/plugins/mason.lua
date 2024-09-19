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
        "bash-language-server",
        "eslint-lsp",
        "json-lsp",
        "lua-language-server",
        "pyright",
        "ruff",
        "sqls",
        "taplo",
        "typescript-language-server",
        "vtsls",
        "yaml-language-server",
        "eslint_d",
        "jsonlint",
        "shellcheck",
        "sqlfluff",
        "yamllint",
        "beautysh",
        "black",
        "prettier",
        "shfmt",
        "stylua",
      },
    },
  },
}
