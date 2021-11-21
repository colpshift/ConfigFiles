--[[
lvim is the global options object
After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
]]

--
-- general ----------
--
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

--
-- keymappings ----------
--
-- view all the defaults by pressing <leader>Lk
lvim.leader = "space"
lvim.keys.normal_mode = {
        -- Page down/up
        ["[d"] = "<PageUp>",
        ["]d"] = "<PageDown>",
        -- Navigate buffers
        ["<Tab>"] = ":bnext<CR>",
        ["<S-Tab>"] = ":bprevious<CR>",
        -- save, quit
        ["<C-s>"] = ":w<cr>",
        ["<C-q>"] = ":q<cr>",
        -- undo search highlight results
        ["<F2>"] = ":nohlsearch",
        -- indent whole file
        ["<F7>"] = "mzgg=G`z",
}
-- nvim keybind
-- timestamp
vim.api.nvim_set_keymap('i', '<F10>',  [[<C-R>=strftime("%d/%m/%Y %H:%M:%S")<CR>]], { noremap = true, silent = true })
-- which-key
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
        name = "+Trouble",
        r = { "<cmd>Trouble lsp_references<cr>", "References" },
        f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
        d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
        q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
        l = { "<cmd>Trouble loclist<cr>", "LocationList" },
        w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

--
-- Additional Plugins ----------
--
lvim.plugins = {
        { "folke/tokyonight.nvim" },
        { "folke/trouble.nvim", cmd = "TroubleToggle" },
        { "onsails/lspkind-nvim" },
        { "hrsh7th/cmp-emoji" },
        { "ray-x/cmp-treesitter" },
        { "tamago324/cmp-zsh" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { "hrsh7th/vim-vsnip-integ" },
}

--
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
--
lvim.autocommands.custom_groups = {
        { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
}

--
-- options ----------
--
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300 -- faster completion
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.lazyredraw = true
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.cursorline = true -- highlight the current line
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.completeopt = { "menu", "menuone", "noselect" }
--
vim.opt.smartcase = true -- smart case
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.inccommand = "split"  -- Show interactive preview of substitute changes
--
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
--
vim.opt.autoindent = true -- indent match with the previous line
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.smartindent = true -- indent after colon for if or for statements
vim.opt.smarttab = true -- Uses shiftwidth instead of tabstop at start of lines
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 2 -- Causes backspace to delete 2 spaces converted tab
vim.backspace = "eol,start,indent" -- Make sure backspace works in insert mode
--
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
--
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
--
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
--
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2
--
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.backup = false -- creates a backup file
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.swapfile = false -- creates a swapfile
--
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.g.python3_host_prog = "/bin/python3"
vim.g.python_host_prog = "/bin/python2"
vim.g.ruby_host_prog = "/home/colps/.local/share/gem/ruby/3.0.0/bin/bin/neovim-ruby-host"

--
-- LSP settings ----------
--
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client,bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- -- you can overwrite the null_ls setup table (useful for setting the root_dir function)
lvim.lsp.null_ls.setup = {
        root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
}
-- formatters
--lvim.lang.python.formatters = { { exe = "black" } }
-- linters
--lvim.lang.python.linters = { { exe = "flake8" } }

--
-- Plugins settings ----------
--

-- Telescope
-- use j and k for navigation and n and p for history in both input and normal mode.
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

-- treesitter
lvim.builtin.treesitter.ensure_installed = {
        "bash",
        "c",
        "javascript",
        "json",
        "lua",
        "python",
        "typescript",
        "css",
        "rust",
        "java",
        "yaml",
        "html",
}
require'nvim-treesitter.configs'.setup {
        indent = {
                enable = true
        },
        incremental_selection = {
                enable = true,
                keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                },
        },
        highlight = {
                enable = true,
                custom_captures = {
                        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
                        ["foo.bar"] = "Identifier",
                },
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
        },
}
--
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
