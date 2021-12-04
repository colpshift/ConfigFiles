-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.options = {
   relativenumber = true,
   dashboard = true,
   writebackup = false,
   swapfile = false,
   python3_host_prog = "/bin/python3",
   python_host_prog = "/bin/python2",
   ruby_host_prog = "/home/colps/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host",
}

-- M.ui = {
--    theme = "Tokyonight",
-- }

-- NvChad included plugin options & overrides
M.plugins = {
   status = {
      -- dashboard = true,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   default_plugin_config_replace = {},
}

return M
