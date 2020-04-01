"
" File: .vimrc
" Path: $HOME
" Tags: vim editor
" Description: vim configuration file
" Last Modified: 03/03/2020 22:20
" Author: Colpshift
"
"------------------------------------------------------------------------------
" start settings
"------------------------------------------------------------------------------
set nocompatible
syntax on
filetype plugin indent on
set fileformat=unix
set autoread		" Automatically re-read files if unmodified inside Vim.
set autowrite           " Automatically save before commands like:next & :make
set confirm             " Display confirmation dialog when closing unsaved file
set nomodeline         " Ignore file’s mode line.

"------------------------------------------------------------------------------
" plugins package manager - vim-plug
"------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-plug'
        " plugin manager
    "---------------------------
    Plug 'morhetz/gruvbox'
    Plug 'dracula/vim', { 'as': 'dracula' }
        " vim color theme
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        " status/tabline for vim
    "---------------------------
    Plug 'RRethy/vim-illuminate'
        " automatically highlighting other uses of the word under the cursor
    Plug 'luochen1990/rainbow'
        " shows different levels of parentheses in different colors.
    Plug 'kshenoy/vim-signature'
        " place, toggle and display marks.
    Plug 'TaDaa/vimade'
        "fades your inactive buffers.
    Plug 'ap/vim-css-color'
        "Preview colours in source code. 
    "---------------------------
    Plug 'junegunn/fzf.vim'
        " Things you can do with fzf and Vim.
    "---------------------------
    Plug 'w0rp/ale'
        " Check syntax in Vim asynchronously and fix files
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " Code Completion for VIM/NeoVIM
    Plug 'tjdevries/coc-zsh'
        "coc.nvim source for Zsh completions
    Plug 'tpope/vim-fugitive'
        "Vim plugin for Git"
    "---------------------------
    Plug 'honza/vim-snippets'
        " snippets for vim
    "---------------------------
    Plug 'francoiscabrol/ranger.vim'
        " Ranger integration
    "__________________________
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
        " Markdown preview
    "__________________________
call plug#end()

"------------------------------------------------------------------------------
" plugins configuration
"------------------------------------------------------------------------------
" rainbow
    let g:rainbow_active = 1
" iluminate
    " Time in milliseconds (default 250)
    let g:Illuminate_delay = 250
    " blacklist
    let g:Illuminate_ftblacklist = ['nerdtree']
    " whitelist by groups
    "let g:Illuminate_ftHighlightGroups = {
    "    \ 'vim': ['vimVar', 'vimString', 'vimLineComment',
    "    \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc']
    "    \ }
    let g:molokai_original = 1
    let g:rehash256 = 1
" gruvbox
    let g:gruvbox_contrast_dark = 'medium'
    let g:gruvbox_invert_tabline = '1'
    let g:gruvbox_invert_indent_guides = '1'
    let g:gruvbox_invert_tabline = '1'
    "let g:gruvbox_improved_strings = '1'
    let g:gruvbox_improved_warnings = '1'
    let g:gruvbox_italic = '1'
    let g:gruvbox_bold = '1'
    let g:gruvbox_underline = '1'
    let g:gruvbox_undercurl = '1'
" airline
    let g:airline_theme='gruvbox'
    let g:airline_highlighting_cache = 1
" spell
   " set spell
   " set spelllang=en-US
   " set spellsuggest=best,5
   " let s:c=",underline"
   " let spell_auto_type="text,doc,mail,"
   " autocmd FileType markdown setlocal spell
" Coc
    " if hidden is not set, TextEdit might fail.
    set hidden
    " Better display for messages
    set cmdheight=2
    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    " always show signcolumns
    set signcolumn=yes
    " Give more space for displaying messages.
    set cmdheight=2
    " mapping TAB
    let g:coc_snippet_next = '<tab>'
    " Extensions
    " - coc-snippets
    " - coc-tsserver
    " - coc-git
    " - coc-python
    " - coc-eslint
    " - coc-pairs
    " - coc-smartf
    " - coc-java
    " - coc-yank
    " - coc-lists
    " - coc-prettier
    " - coc-json
    " - coc-highlight
    " - coc-html
    " - coc-css
    " - coc-wxml
"ale
    set omnifunc=ale#completion#OmniFunc
    let g:ale_enabled = 1
    let g:ale_completion_enabled = 1
    let g:ale_completion_tsserver_autoimport = 1
    let g:ale_sign_column_always = 1
    let g:ale_set_highlights = 1
    let g:airline#extensions#ale#enabled = 1
    let g:ale_echo_cursor = 1
    let g:ale_cursor_detail = 1
    let g:ale_set_loclist = 0
    let g:ale_list_vertical = 1
    let g:ale_list_window_size = 5
    let g:ale_lint_on_text_changed = 1
    let g:ale_lint_on_enter = 1
    let g:ale_set_quickfix = 1
    let g:ale_fix_on_save = 1
    let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],}
"instant markdown
    let g:instant_markdown_browser = "firefox --new-window"
    "let g:instant_markdown_autoscroll = 1
" FZF
    let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
    " Default fzf layout  - down / up / left / right
    let g:fzf_layout = { 'down': '~40%' }
    " Customize fzf colors to match your color scheme
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
    let g:fzf_history_dir = '~/.local/share/fzf-history'

"------------------------------------------------------------------------------
" mapping and abbreviations
"----------------------------------------------'--------------------------------
" mapleader
map <Space> <Leader>
" auto indent the whole file and keep your cursor in the last position
nmap <leader>ia mzgg=G`z
" abbreviations
ab ~/ $HOME
" run :w!! command (type fast), to save ready only files.
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" undo hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
" insert timestamp
inoremap <F10> <C-R>=strftime("%d/%m/%Y %H:%M")<CR>
" Coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
"
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"------------------------------------------------------------------------------
" Performance
"------------------------------------------------------------------------------
set complete-=i		" Limit the files searched for auto-completes.
set lazyredraw		" Don’t update screen during macro and script execution.

"------------------------------------------------------------------------------
" Text Rendering
"------------------------------------------------------------------------------
set display+=lastline	" Always try to show a paragraph’s last line.
set encoding=utf-8	" Use an encoding that supports unicode.

"------------------------------------------------------------------------------
" interface
"------------------------------------------------------------------------------
set formatoptions+=l    " make settings permanent.
set shortmess=atIc	" Don’t show the intro message when starting Vim
set nostartofline	" Don’t reset cursor start of line when moving around.
set number
set relativenumber
set cursorline
set ruler               " right side of the status line at the bottom
set mouse=a             " allow mouse clicks to change cursor position
set showmatch           " highlight matching [{()}]
set wildmenu            " expand the menu
set colorcolumn=+1      " color de last column to wrap.
set textwidth=79        " set width for text
set winwidth=100        " set the minimal width of the current window.
set scrolloff=1		" Number screen lines keep above and below cursor.
set sidescrolloff=5	" Number screen columns keep left and right cursor.
set wrap		" Enable line wrapping.
set wrapmargin=0        " Prevent insert line breaks in newly entered text.
set linebreak		" Avoid wrapping a line in the middle of a word.
"set showbreak='↳ '     " String at the start of lines that have been wrapped
"set cpo=n               " Show linebreaks on number column
set showcmd             " show command in bottom bar
set showmode            " change the color in according of mode
set clipboard+=unnamed  " to use clipboard
set noerrorbells	" Disable beep on errors.
set visualbell		" Flash the screen instead of beeping on errors.
set background=dark
colorscheme gruvbox

"------------------------------------------------------------------------------
" searching
"------------------------------------------------------------------------------
set ignorecase      " case insensitive
set smartcase       " use case if any caps used
set incsearch       " show match as search proceeds
set hlsearch        " highlight matches

"------------------------------------------------------------------------------
" indention
"------------------------------------------------------------------------------
set autoindent          " indent match with the previous line
set smartindent         " indent after colon for if or for statements
set smarttab            " Uses shiftwidth instead of tabstop at start of lines
set expandtab		" Replaces a TAB with spaces--more portable
set shiftwidth=4        " The amount to block indent when using
set softtabstop=4       " Causes backspace to delete 4 spaces converted TAB
set shiftround		" Round the indentation to earest multiple shiftwidth.
set backspace=eol,start,indent	" Make sure backspace works in insert mode

"------------------------------------------------------------------------------
" folding
"------------------------------------------------------------------------------
set foldenable	        " enable fold
set foldcolumn=1	" show column indent
set foldmethod=indent   " indentation method
"
"define folds by indent level, but can create folds manually too.
"augroup vimrc
"  au BufReadPre * set foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setl foldmethod=manual | endif
"augroup END

"------------------------------------------------------------------------------
" swap, undo and backup
"------------------------------------------------------------------------------
set swapfile
set directory=$HOME/.vim/swaps/
set undofile
set undodir=$HOME/.vim/undo/
"set backup
"set backupdir=$HOME/.vim/backups/
