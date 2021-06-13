--
-- Path: ~/.config/nvim/lua/settings.lua
-- Tags: lua nvim
-- Description: lua config nvim
-- Author: Colpshift
-- Last Update: 13/06/2021 10:01
--

-- lua api
-- vim.api.nvim_set_option()     -— global options
-- vim.api.nvim_buf_set_option() -— buffer-local options
-- vim.api.nvim_win_set_option() -— window-local options

VIM = vim.api.nvim_set_option()
local o = VIM.opt

------------------------------------------------------------------------------
-- interface
------------------------------------------------------------------------------
o.termguicolors = true    -- true colors
o.hidden = true           -- keep multiple buffers open.
o.encoding = 'utf-8'
o.cmdheight = 2           -- Give more space for displaying messages
o.updatetime = 300
o.signcolumn = 'auto'
o.formatoptions = '+l'    -- make settings permanent.
o.shortmess = '+atIc'     -- Don’t show the intro message when starting Vim
o.nostartofline = true    -- Don’t reo.cursor start of line when moving around.
o.number = true
o.relativenumber = true
o.cursorline = true
o.ruler = true            -- right side of the status line at the bottom
o.mouse = 'a'             -- allow mouse clicks to change cursor position
o.showmatch = true        -- highlight matching [{()}]
o.wildmenu = true         -- Wildmenu enable
o.colorcolumn = 2         -- color de last column to wrap.
o.textwidth = 79          -- o.width for text
o.winwidth = 110          -- o.the minimal width of the current window.
o.pumheight = 10          -- makes popup menu smaller
o.scrolloff = 1           -- Number screen lines keep above and below cursor.
o.sidescrolloff = 5       -- Number screen columns keep left and right cursor.
o.showcmd = true          -- show command in bottom bar
o.showmode = true         -- change the color in according of mode
o.clipboard = '+unnamedplus'  -- copy and paste between vim and all.
o.noerrorbells = true     -- Disable beep on errors.
o.visualbell = true       -- Flash the screen instead of beeping on errors.
o.nojoinspaces = true     -- Prevents inserting spaces after punctuation on join
o.splitbelow = true       -- Horizontal split below current.
o.splitright = true       -- Vertical split to right of current.
o.laststatus = 2          -- Size of command area and airline
o.background = 'dark'
o.colorscheme = 'gruvbox'

------------------------------------------------------------------------------
-- tabs
------------------------------------------------------------------------------
o.switchbuf = 'usetab'

------------------------------------------------------------------------------
-- searching
------------------------------------------------------------------------------
o.ignorecase = true    -- case insensitive
o.smartcase  = true    -- use case if any caps used
o.incsearch  = true    -- show match as search proceeds
o.hlsearch = 'is'      -- highlight matches
o.inccommand = 'split' -- Show interactive preview of substitute changes

------------------------------------------------------------------------------
-- indention
-----------------------------------------------------------------------------
o.wrap = 'breakindent'  -- Soft wrapping + indentation
o.autoindent = true     -- indent match with the previous line
o.smartindent = true    -- indent after colon for if or for statements
o.smarttab = true       -- Uses shiftwidth instead of tabstop at start of lines
o.expandtab = true      -- Replaces a tab with spaces--more portable
o.shiftwidth = 2        -- The amount to block indent when using
o.softtabstop = 2       -- Causes backspace to delete 2 spaces converted tab
o.shiftround = true     -- Round the indentation to earest multiple shiftwidth.
o.backspace = 'eol,start,indent' -- Make sure backspace works in insert mode

------------------------------------------------------------------------------
-- folding
------------------------------------------------------------------------------
-- To fold the next 12 lines,        run zf12j
-- To fold the next paragraph,       run zf}
-- To fold to the end of the file,   run zfG
-- To open all folds,                run zR
-- To close all folds,               run zM
--
o.foldenable = true       -- enable fold
o.foldcolumn = 2          -- show column indet
o.foldmethod = 'indent'   -- indentation method

------------------------------------------------------------------------------
-- swap, undo and backup
------------------------------------------------------------------------------
o.undofile = true
o.undodir = '$HOME/.local/share/nvim/undo'
o.noswapfile = true
o.nobackup = true
o.nowritebackup = true

------------------------------------------------------------------------------
-- code environments
------------------------------------------------------------------------------
--
-- Python
o.python3_host_prog = '/bin/python3'
o.python2_host_prog = '/bin/python2'
--
-- Rust
o.rust_clip_command = 'xclip -selection clipboard'
--

