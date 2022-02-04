-- Example plugins file!
-- (suggestion) -> lua/custom/plugins/init.lua or anywhere in custom dir

return {
   { "elkowar/yuck.vim", ft = "yuck" },
   { "williamboman/nvim-lsp-installer" },
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
         -- require("customPlugins.confs.null-ls").setup()
      end,
   },
   { "hrsh7th/cmp-emoji", after = "nvim-cmp" },
   { "davidgranstrom/nvim-markdown-preview" },
}
