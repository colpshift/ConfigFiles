local lint = require("lint")

lint.linters_by_ft = {
  lua = { "stylelint" },
  css = { "eslint_d" },
  html = { "eslint_d" },
  sh = { "shellcheck" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  python = { "flake8" },
  sql = { "sqlfluff" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function ()
    lint.try_lint()
  end,
})

