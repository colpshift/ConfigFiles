local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- formatting
  b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "yaml", "markdown", "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "json" } },
  b.formatting.stylua,
  b.formatting.clang_format,
  b.formatting.shfmt.with { filetypes = { "sh" } },
  b.formatting.beautysh.with { filetypes = { "bash", "csh", "ksh", "sh", "zsh"} },
  b.formatting.autopep8.with { filetypes = { "python"} },

  -- code actions
  b.code_actions.shellcheck.with { filetypes = { "sh" } },

  -- diagnostics
  b.diagnostics.shellcheck.with { filetypes = { "sh" } },
  b.diagnostics.flake8.with { filetypes = { "python"} },

  -- completion
  b.completion.luasnip.with { filetypes = { "lua"} },

}

null_ls.setup {
  debug = true,
  sources = sources,
}
