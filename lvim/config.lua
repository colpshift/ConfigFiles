--
-- general
--

lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight"
lvim.line_wrap_cursor_movement = true
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

--
-- keymappings
--

lvim.leader = "space"
lvim.keys.normal_mode = {
  -- Page down/up
  ["[d"] = "<PageUp>",
  ["]d"] = "<PageDown>",
  -- Navigate buffers
  ["<Tab>"] = ":bnext<CR>",
  ["<S-Tab>"] = ":bprevious<CR>",
  -- save /quit
  ["<C-s>"] = ":w<cr>",
  ["<C-q>"] = ":q<cr>",
  -- undo highlight search
  ["<F2>"] = ":nohlsearch<cr>",
}
vim.cmd([[
inoremap <F10> <C-R>=strftime("%d/%m/%Y %H:%M:%S")<CR>
nmap <F7> mzgg=G`z
]])

--
-- Additional Plugins
--

lvim.plugins = {
  {"folke/tokyonight.nvim"}, {
    "ray-x/lsp_signature.nvim",
    config = function() require"lsp_signature".on_attach() end,
    event = "InsertEnter"
  },
  { "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  },
  {"folke/lua-dev.nvim",
    config = function()
      local luadev = require("lua-dev").setup({
        lspconfig = lvim.lang.lua.lsp.setup
      })
      lvim.lang.lua.lsp.setup = luadev
    end
  },
  {"lukas-reineke/indent-blankline.nvim"}
}

--
-- Plugins config
--

-- indent-blankline
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
}

-- Telescope
-- navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

-- which-key
-- add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}

-- Treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

--
-- Options
--

vim.opt.updatetime = 300 -- faster completion
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
--
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
--
vim.opt.shortmess = "atIc" --Don’t show the intro message when starting Vim
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
--
vim.opt.cursorline = true -- highlight the current line
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
--
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.pumheight = 10 -- pop up menu height
--
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
--
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
--
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.smartcase = true -- smart case
--
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
--
vim.opt.showtabline = 2 -- always show tabs
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
--
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
--
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.inccommand = "split"  -- Show interactive preview of substitute changes
vim.opt.incsearch = true -- show match as search proceeds
--
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.autoindent = true -- indent match with the previous line
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.colorcolumn = "99999" -- fixes indentline for now
--
vim.opt.backspace = "eol,start,indent"
vim.opt.softtabstop = 2 -- " Causes backspace to delete 2 spaces converted tab
--
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
--
vim.opt.undodir = "/home/colps/.local/share/lunarvim/undo" -- set an undo directory
vim.opt.undofile = true -- enable persistent undo
--
vim.opt.backup = false -- creates a backup file
vim.opt.writebackup = false
--
vim.opt.swapfile = false -- creates a swapfile
--
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
--
vim.g.python_host_prog = "/bin/python2"
vim.g.python3_host_prog = "/bin/python3"

--
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
--

lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=2 sw=2" },
}

--
-- LSP settings
--

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)
-- language servers
lvim.lsp.null_ls.setup = {
  root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules", "package.json", "tsconfig.json", "jsconfig.json" ),
}
-- formatters
lvim.lang.python.formatters = { { exe = "black", args = {} } }
lvim.lang.javascript.formatters = { { exe = "eslint"}, { exe = "prettier" } }
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.json.formatters = { { exe = 'json_tool│prettier│prettierd' } }
-- linters
lvim.lang.python.linters = { { exe = "flake8", args = {} } }
lvim.lang.javascript.linters = { { exe = "eslint" } }
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters

