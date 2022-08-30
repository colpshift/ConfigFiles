-- Just an example, supposed to be placed in /lua/custom/

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.options = {
   relativenumber = true,
   dashboard = true,
   writebackup = false,
   swapfile = false,
}

M.ui = {
  theme = "gruvchad",
}

M.plugins = {
  options = {
    lspconfig = {
      servers = {"html","cssls","bashls","sumneko_lua","yamlls","vimls","pyright","tsserver"},
    }
  }
}

return M
