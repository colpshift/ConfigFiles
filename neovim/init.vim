"
" File: .vimrc
" Path: $HOME
" Tags: neovim editor
" Description: nvim configuration file
" Last Modified: 14/04/2020 23:53
" Author: Colpshift
"

"------------------------------------------------------------------------------
" start settings
"------------------------------------------------------------------------------
set nocompatible
syntax on
filetype plugin indent on
set fileformat=unix
set autoread            " Automatically re-read files if unmodified inside Vim.
set autowrite           " Automatically save before commands like:next & :make
set confirm             " Display confirmation dialog when closing unsaved file
set shellpipe="2>&1| tee" "option  for C compiler
set shellredir=">&"       "options for C compiler

"------------------------------------------------------------------------------
" plugins package manager - vim-plug
"------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
    "-------------zo--------------
    Plug 'morhetz/gruvbox'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'joshdick/onedark.vim'
        " vim color theme
    Plug 'ryanoasis/vim-devicons'
        " icons for languages
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
    Plug '/usr/share/fzf/'
        " Things you can do with fzf and Vim.
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
        "Ranger running in a floating window
    Plug 'preservim/nerdcommenter'
        " nerdy commenting powers
    "---------------------------
    Plug 'tpope/vim-surround'
        " Quoting/Parenthesizing
    "---------------------------
    Plug 'dense-analysis/ale'
        " Provides syntax checking and semantic errors
    Plug 'Shougo/deoplete.nvim'
        " Provides completion
    Plug 'deoplete-plugins/deoplete-zsh'
        " plugin deoplete
    Plug 'SirVer/ultisnips'
        " Snippets
    Plug 'honza/vim-snippets'
        " Snippets
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
        " Povides Tern-based JavaScript editing support
    Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
        " Markdown preview
    "---------------------------
call plug#end()

"------------------------------------------------------------------------------
" plugins configuration
"------------------------------------------------------------------------------
"
" airline
  let g:airline_theme='onedark'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_highlighting_cache = 1
"
" rainbow
  let g:rainbow_active = 1
"
" signature
  " mx           Toggle mark 'x' and display it in the leftmost column
  " dmx          Remove mark 'x' where x is a-zA-Z
  " m-           Delete all marks from the current line
  " m<Space>     Delete all marks from the current buffer
  " ]`           Jump to next mark
  " [`           Jump to prev mark
"
" iluminate
  " Time in milliseconds (default 250)
  let g:Illuminate_delay = 250
"
" Surround
  " Emphasize word: ysiw"
  " Emphasize line: yss"
  " Delete ds"
"
" Markdown preview
  let g:mkdp_auto_start = 0
  let g:mkdp_auto_close = 1
  let g:mkdp_browser = '/bin/qutebrowser'
  let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {}
      \ }
"
" Rnvimr
  let g:rnvimr_ex_enable = 1
  let g:rnvimr_ranger_cmd = 'ranger --cmd="set vcs_aware false" ' .
              \'--cmd="set column_ratios 1,1" --cmd="set vcs_aware true"'
  tnoremap <silent> <C-i> <C-\><C-n>:RnvimrResize<CR>
  nnoremap <silent> <C-o> :RnvimrToggle<CR>
  tnoremap <silent> <C-o> <C-\><C-n>:RnvimrToggle<CR>
  let g:rnvimr_layout = { 'relative': 'editor',
              \ 'width': float2nr(round(0.6 * &columns)),
              \ 'height': float2nr(round(0.6 * &lines)),
              \ 'col': float2nr(round(0.2 * &columns)),
              \ 'row': float2nr(round(0.2 * &lines)),
              \ 'style': 'minimal' }
"
" Nerdcommenter
  " Insert comment leader+cc
  " Invert comment leader+ci
  let g:NERDSpaceDelims = 1
  let g:NERDCompactSexyComs = 1
  let g:NERDDefaultAlign = 'left'
  let g:NERDCommentEmptyLines = 1
  let g:NERDTrimTrailingWhitespace = 1
  let g:NERDToggleCheckAllLines = 1
"
" Deoplete
  let g:deoplete#enable_at_startup = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  " omnifuncs
  augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup end
  " automatically closing the scratch window at the top of the vim window
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  " deoplete tab-complete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"
" tern
  if exists('g:plugs["tern_for_vim"]')
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    autocmd FileType javascript setlocal omnifunc=tern#Complete
  endif
  " keybinding for moving the cursor straight to a variable definition 
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
"
" Ultisnips
   let g:UltiSnipsExpandTrigger="<CR>"
"
" Ale
  let g:ale_fix_on_save = 1
  let g:ale_completion_tsserver_autoimport = 1
  let g:airline#extensions#ale#enabled = 1
  let g:ale_set_loclist = 0
  let g:ale_sign_column_always = 1
  let g:ale_set_quickfix = 1
  let g:ale_set_balloons = 1 
  let g:ale_hover_to_preview = 1
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
"
" fzf
  map <silent> <leader>l :FZF<CR>
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
      " Default fzf layout  - down / up / left / right
      "let g:fzf_layout = { 'down': '~40%' }
      let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
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

"------------------------------------------------------------------------------
" mapping and abbreviations
"------------------------------------------------------------------------------
"
" auto indent the whole file and keep your cursor in the last position
nmap <leader>ia mzgg=G`z
"
" run :w!! command (type fast), to save ready only files.
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
"
" undo hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
"
" insert timestamp
inoremap <F10> <C-R>=strftime("%d/%m/%Y %H:%M")<CR>

"------------------------------------------------------------------------------
" Performance
"------------------------------------------------------------------------------
set complete-=i		" Limit the files searched for auto-completes.
set lazyredraw		" Don’t update screen during macro and script execution.
set hid                 " Avoid Vim-Airline to get information on start
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
set showcmd             " show command in bottom bar
set showmode            " change the color in according of mode
set clipboard+=unnamed  " to use clipboard
set noerrorbells	" Disable beep on errors.
set visualbell		" Flash the screen instead of beeping on errors.
set background=dark
colorscheme onedark

"------------------------------------------------------------------------------
" searching
"------------------------------------------------------------------------------
set ignorecase      " case insensitive
set smartcase       " use case if any caps used
set incsearch       " show match as search proceeds
set hlsearch        " highlight matches

"------------------------------------------------------------------------------
" indention
"-----------------------------------------------------------------------------
set wrap breakindent    " Soft wrapping + indentation 
set autoindent          " indent match with the previous line
set smartindent         " indent after colon for if or for statements
set smarttab            " Uses shiftwidth instead of tabstop at start of lines
set expandtab		" Replaces a tab with spaces--more portable
set shiftwidth=2        " The amount to block indent when using
set softtabstop=2       " Causes backspace to delete 2 spaces converted tab
set shiftround		" Round the indentation to earest multiple shiftwidth.
set backspace=eol,start,indent	" Make sure backspace works in insert mode

"------------------------------------------------------------------------------
" folding
"------------------------------------------------------------------------------
set foldenable	        " enable fold
set foldcolumn=2        " show column indent
set foldmethod=indent   " indentation method

"------------------------------------------------------------------------------
" swap, undo and backup
"------------------------------------------------------------------------------
set swapfile
set directory=$HOME/.local/share/nvim/swap
set undofile
set undodir=$HOME/.local/share/nvim/undo
set nobackup
set nowritebackup
set backupdir=$HOME/.local/share/nvim/backup

"------------------------------------------------------------------------------
" Specific settings by filetype
"------------------------------------------------------------------------------
" 
" Indent
"
" 4 spaces
autocmd Filetype python setlocal sw=4 sts=4 expandtab

"------------------------------------------------------------------------------
" Code Environments
"------------------------------------------------------------------------------
"
" ruby
let g:ruby_host_prog = '~/.gem/ruby/2.7.0/bin/neovim-ruby-host'
"
" python
let g:python3_host_prog = '/bin/python3'
let g:python2_host_prog = '/bin/python2'
