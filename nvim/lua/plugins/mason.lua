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
                "beautysh",
                "black",
                "eslint - lsp",
                "html - lsp",
                "htmlbeautifier",
                "htmlhint",
                "json - lsp",
                "jsonlint",
                "lua - language - server",
                "prettier",
                "pyright",
                "ruff",
                "shellcheck",
                "shfmt",
                "sqlfluff",
                "sql - formatter",
                "sqls",
                "stylua",
                "taplo",
                "typescript - language - server",
                "xmlformatter",
                "yaml - language - server",
                "yamllint",
            },
        },
    },
}
