--
-- colps custom
-- lsp config
--
local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config

   local servers = {
      "cmake",
      "cssls",
      "pyright",
      "jsonls",
      --"eslint",
      "intelephense",
      "sumneko_lua",
      "rust_analyzer",
      "solargraph",
      "gopls",
      "jdtls",
      "bashls",
      "html",
      "tsserver",
      "vimls",
      --"null_ls",
   }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end
   --
   -- typescript

   lspconfig.tsserver.setup {
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
      end,
   }

   -- the above tsserver config will remvoe the tsserver's inbuilt formatting
   -- since I use null-ls with denofmt for formatting ts/js stuff.
   --
   -- php

   lspconfig.intelephense.setup {
      settings = {
         intelephense = {
            stubs = {
               "bcmath",
               "bz2",
               "calendar",
               "Core",
               "curl",
               "zip",
               "zlib",
               "wordpress",
               "woocommerce",
               "acf-pro",
               "wordpress-globals",
               "wp-cli",
               "genesis",
               "polylang",
            },
            files = {
               maxSize = 5000000,
            },
         },
      },
   }

   -- lsp installer
   local lsp_installer = require "nvim-lsp-installer"

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }

      if server.name == "rust_analyzer" then
         opts.settings = {
            ["rust-analyzer"] = {
               experimental = {
                  procAttrMacros = true,
               },
            },
         }

         opts.on_attach = function(client, bufnr)
            local function buf_set_keymap(...)
               vim.api.nvim_buf_set_keymap(bufnr, ...)
            end

            -- Run nvchad's attach
            attach(client, bufnr)

            -- Use nvim-code-action-menu for code actions for rust
            buf_set_keymap(
               bufnr,
               "n",
               "<leader>ca",
               "lua vim.lsp.buf.range_code_action()<CR>",
               { noremap = true, silent = true }
            )
            buf_set_keymap(
               bufnr,
               "v",
               "<leader>ca",
               "lua vim.lsp.buf.range_code_action()<CR>",
               { noremap = true, silent = true }
            )
         end
      end

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
