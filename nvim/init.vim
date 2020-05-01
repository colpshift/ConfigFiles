"
" File: .vimrc
" Path: $HOME
" Tags: neovim editor
" Description: nvim configuration file
" Last Modified: 28/04/2020 00:17
" Author: Colpshift
"

"------------------------------------------------------------------------------
" start settings
"------------------------------------------------------------------------------
set nocompatible
syntax on
filetype plugin indent on
set fileformat=unix
set encoding=utf-8      " Use an encoding that supports unicode.
set confirm             " Display confirmation dialog when closing unsaved file
set nostartofline       " Do not jump to first character with page commands.

"------------------------------------------------------------------------------
" Performance
"------------------------------------------------------------------------------
set complete-=i         " Limit the files searched for auto-completes.
set lazyredraw          " Don’t update screen during macro and script execution.
set hid                 " Avoid Vim-Airline to get information on start
set ttyfast             " Improve smoothness of redrawing   

"------------------------------------------------------------------------------
" plugins package manager - vim-plug
"------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
  "---------------------------
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'joshdick/onedark.vim'
  " vim color themes
  Plug 'ryanoasis/vim-devicons'
  " icons for languages
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " status/tabline for vim that's light as air
  "---------------------------
  Plug 'RRethy/vim-illuminate'
  " automatically highlighting other uses of the word under the cursor
  Plug 'kshenoy/vim-signature'
  " place, toggle and display marks.
  Plug 'TaDaa/vimade'
  " fades your inactive buffers.
  Plug 'ap/vim-css-color'
  " Preview colours in source code.
  "---------------------------
  Plug '/usr/share/fzf/'
  " Things you can do with fzf and Vim.
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  " Ranger running in a floating window
  Plug 'preservim/nerdcommenter'
  " nerdy commenting powers
  "---------------------------
  Plug 'machakann/vim-sandwich'
  " search/select/edit sandwiched textobjects.
  Plug 'andymass/vim-matchup'
  "  extends vim's % key to language-specific words
  "---------------------------
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Provides completion.
  Plug 'honza/vim-snippets'
  " Snippets
  Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
  " Markdown preview
  "---------------------------
call plug#end()

"------------------------------------------------------------------------------
" plugins configuration
"------------------------------------------------------------------------------
"
" airline
  let g:airline_theme='gruvbox'
  let g:airline_powerline_fonts = 1
  let g:airline_highlighting_cache = 1
  let g:airline_left_sep = ' '
  let g:airline_left_alt_sep = '|'
  let g:airline_right_sep = ' '
  let g:airline_right_alt_sep = '|'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ' '
  let g:airline#extensions#tabline#right_alt_sep = '|'
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
  let g:Illuminate_delay = 200
"
" Sandwich
  " include - saiw( makes foo to (foo).
  " replace - srb" or sr(" makes (foo) to "foo".
  " delete  - sdb or sd( makes (foo) to foo.
  " ib and is - selects {surrounded text}.
  " ab and as - selects {surrounded text} including {surrounding}s.
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
" Coc
  let g:airline#extensions#coc#enabled = 1
  " Use tab for trigger completion with characters ahead and navigate.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  "
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  " Use <cr> to confirm completion.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif
  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  "
  " Coc smartf plugin
  " press <esc> to cancel.
  nmap f <Plug>(coc-smartf-forward)
  nmap F <Plug>(coc-smartf-backward)
  nmap ; <Plug>(coc-smartf-repeat)
  nmap , <Plug>(coc-smartf-repeat-opposite)
  "
  augroup Smartf
    autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
    autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
  augroup end
  "
  " Coc highlight plugin
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd FileType json syntax match Comment +\/\/.\+$+
  "
  " Coc actions plugin
  " Remap for do codeAction of selected region
  function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
  endfunction
  xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
  nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
  "
  " Coc spell checker plugin
  " Words not in the dictionary files will have a squiggly underline.
  nnoremap <silent> <F8> <Esc>:CocCommand cSpell.addIgnoreWord<CR>
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
" run :w!! command (type fast), to save ready only files.
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
"
" undo hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
"
" auto indent the whole file and keep your cursor in the last position
nmap <F7> mzgg=G`z
"
" Clear whitespaces
nnoremap <silent> <F9> <Esc>:%s/\s\+$//e<CR>
"
" insert timestamp
inoremap <F10> <C-R>=strftime("%d/%m/%Y %H:%M")<CR>
"
" move to next and previous buffer
nnoremap <F3> :bnext<CR>

"------------------------------------------------------------------------------
" interface
"------------------------------------------------------------------------------
set hidden              " keep multiple buffers open.
set cmdheight=2         " Give more space for displaying messages
set updatetime=300
set signcolumn=yes
set formatoptions+=l    " make settings permanent.
set shortmess=atIc      " Don’t show the intro message when starting Vim
set nostartofline       " Don’t reset cursor start of line when moving around.
set number
set relativenumber
set cursorline
set ruler               " right side of the status line at the bottom
set mouse=a             " allow mouse clicks to change cursor position
set showmatch           " highlight matching [{()}]
set wildmenu            " Wildmenu enable
set colorcolumn=+1      " color de last column to wrap.
set textwidth=79        " set width for text
set winwidth=110        " set the minimal width of the current window.
set pumheight=10        " makes popup menu smaller
set scrolloff=1         " Number screen lines keep above and below cursor.
set sidescrolloff=5     " Number screen columns keep left and right cursor.
set showcmd             " show command in bottom bar
set showmode            " change the color in according of mode
set clipboard+=unnamedplus " copy and paste between vim and all.
set noerrorbells        " Disable beep on errors.
set visualbell          " Flash the screen instead of beeping on errors.
set nojoinspaces        " Prevents inserting spaces after punctuation on join.
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
set laststatus=2        " Size of command area and airline
set background=dark
colorscheme gruvbox
color
"------------------------------------------------------------------------------
" searching
"------------------------------------------------------------------------------
set ignorecase        " case insensitive
set smartcase         " use case if any caps used
set incsearch         " show match as search proceeds
set hlsearch is       " highlight matches
set inccommand=split  " Show interactive preview of substitute changes

"------------------------------------------------------------------------------
" indention
"-----------------------------------------------------------------------------
set wrap breakindent    " Soft wrapping + indentation
set autoindent          " indent match with the previous line
set smartindent         " indent after colon for if or for statements
set smarttab            " Uses shiftwidth instead of tabstop at start of lines
set expandtab           " Replaces a tab with spaces--more portable
set shiftwidth=2        " The amount to block indent when using
set softtabstop=2       " Causes backspace to delete 2 spaces converted tab
set shiftround          " Round the indentation to earest multiple shiftwidth.
set backspace=eol,start,indent  " Make sure backspace works in insert mode

"------------------------------------------------------------------------------
" folding
"------------------------------------------------------------------------------
set foldenable          " enable fold
set foldcolumn=2        " show column indent
set foldmethod=indent   " indentation method

"------------------------------------------------------------------------------
" swap, undo and backup
"------------------------------------------------------------------------------
set swapfile
set directory=$HOME/.local/share/nvim/swap
set undofile
set undodir=$HOME/.local/share/nvim/undo
set nobackup      " Recommended by coc
set nowritebackup " Recommended by coc
set backupdir=$HOME/.local/share/nvim/backup

"------------------------------------------------------------------------------
" Error handling
"------------------------------------------------------------------------------
"
" characters to show for expanded TABs, trailing whitespace and end-of-lines.
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,space:
endif
set list

"------------------------------------------------------------------------------
" Specific settings by filetype
"------------------------------------------------------------------------------
"
" Indent
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
"
" markdown
set conceallevel=0    "show `` in markdown files
"
" clang
"set shellpipe="2>&1| tee" " option  for C compiler
"set shellredir=">&"       " options for C compiler
"
