-- MAPPINGS
local map = require("core.utils").map
map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
-- NOTE: the 4th argument in the map function can be a table i.e options but its most likely un-needed so dont worry about it

-- Install plugins
local customPlugins = require "core.customPlugins"
customPlugins.add(function(use)
   use {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
   }
   use {
      "williamboman/nvim-lsp-installer",
   }
   use {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   }
   use {
      "hrsh7th/cmp-emoji",
      after = "nvim-cmp",
   }
   use {
      "davidgranstrom/nvim-markdown-preview",
   }
end)

