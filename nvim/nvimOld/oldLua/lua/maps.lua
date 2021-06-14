--
-- Path: ~/.config/nvim/lua/maps.lua
-- Tags: lua nvim
-- Description: lua config nvim
-- Author: Colpshift
-- Last Update: 13/06/2021 10:01
--

-- lua api
-- vim.api.nvim_set_option() — global options
-- vim.api.nvim_buf_set_option() — buffer-local options
-- vim.api.nvim_win_set_option() — window-local options

local o = vim.o
local wo = vim.wo
local bo = vim.bo

------------------------------------------------------------------------------
-- interface
------------------------------------------------------------------------------
-- move to next and previous buffer
nnoremap <F3> :bnext<CR>

--------------------------------------------------------------------------------
-- tabs
--------------------------------------------------------------------------------
nnoremap <F4> :sbnext<CR>
nnoremap <S-F4> :sbprevious<CR>

--------------------------------------------------------------------------------
-- searching
--------------------------------------------------------------------------------
-- undo hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

--------------------------------------------------------------------------------
-- indention
-------------------------------------------------------------------------------
set pastetoggle=<F5>    -- Turn off auto-indent when pasting text
-- auto indent the whole file and keep your cursor in the last position
nmap <F7> mzgg=G`z

--------------------------------------------------------------------------------
-- code environments
--------------------------------------------------------------------------------
--
-- Clear whitespaces
nnoremap <silent> <F9> <Esc>:%s/\s\+$//e<CR>
--
--Insert timestamp
inoremap <F10> <C-R>=strftime(--%d/%m/%Y %H:%M--)<CR>
--
-- Copying to X11 primary selection with the mouse
vnoremap <LeftRelease> --*ygv

n

