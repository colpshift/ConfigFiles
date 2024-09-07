local lint = require("lint")

lint.linters_by_ft = {
  lua = { "luacheck" },
  css = { "eslind" },
  html = { "htmlhint" },
  sh = { "shellcheck" },
  json = { "jsonlint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function ()
    lint.try_lint()
  end,
}
)
