"
" File: .vimrc
" Path: $HOME
" Tags: neovim editor
" Description: nvim configuration file
" Last Modified: 30/03/2021 12:23
" Author: Colpshift
"
" https://neovim.io/
"
"------------------------------------------------------------------------------
" plugins package manager - vim-plug
"------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
"---------------------------
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
" vim color themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" status/tabline for vim that's light as air
Plug 'ryanoasis/vim-devicons'
" icons
"---------------------------
Plug 'RRethy/vim-illuminate'
" automatically highlighting other uses of the word under the cursor
Plug 'kshenoy/vim-signature'
" place, toggle and display marks.
Plug 'luochen1990/rainbow'
" show diff level of parentheses in diff color
Plug 'ap/vim-css-color'
" Preview colours in source code.
"---------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Things you can do with fzf and Vim.
"---------------------------
Plug 'machakann/vim-sandwich'
" search/select/edit sandwiched textobjects.
Plug 'andymass/vim-matchup'
" extends vim's % key to language-specific words
Plug 'preservim/nerdcommenter'
" nerdy commenting powers
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
" ranger
Plug 'easymotion/vim-easymotion'
" vim motion
"---------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'scalameta/nvim-metals'
" LSP
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
"Completion
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" markdown preview
Plug 'hrsh7th/vim-vsnip'
Plug 'honza/vim-snippets'
" Snippets
"---------------------------
Plug 'rust-lang/rust.vim'
" Languages
"---------------------------
call plug#end()

"------------------------------------------------------------------------------
" plugins configuration
"------------------------------------------------------------------------------
"
" gruvbox theme
"
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_improved_warnings = 1
let g:gruvbox_invert_signs = 1
"
" airline
"
let g:airline_theme = 'dracula'
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
"
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx          Remove mark 'x' where x is a-zA-Z
" m-           Delete all marks from the current line
" m<Space>     Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
"
" iluminate
"
let g:Illuminate_delay = 200
"
" Sandwich
"
" include - saiw( makes foo to (foo).
" replace - srb" or sr(" makes (foo) to "foo".
" delete  - sdb or sd( makes (foo) to foo.
" ib and is - selects {surrounded text}.
" ab and as - selects {surrounded text} including {surrounding}s.
"
" Easymotion
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" word motions
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"
" Rainbow
"
let g:rainbow_active = 1
"
" Nerdcommenter
"
" Insert comment leader+cc
" Invert comment leader+ci
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
"
" ranger
"
" open ranger when vim open a directory
let g:ranger_replace_netrw = 1
"
" fzf
"
map <silent> <leader>l :FZF<CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
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
"
" window preview
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
"
" markdown preview
"
let g:mkdp_browser = 'surf'
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
"
" LSP
"
lua << EOF
--
--
-- lsp config
require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.sumneko_lua.setup{}
require'lspconfig'.bashls.setup{}
--
EOF
"
" Completion
"
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
highlight link CompeDocumentation NormalFloat

"------------------------------------------------------------------------------
" interface
"------------------------------------------------------------------------------
set termguicolors       " true colors
set hidden              " keep multiple buffers open.
set cmdheight=2         " Give more space for displaying messages
set updatetime=300
set signcolumn=auto:2
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
set colorcolumn=+2      " color de last column to wrap.
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
colorscheme dracula
nnoremap <F3> :bnext<CR>
" move to next and previous buffer

"------------------------------------------------------------------------------
" tabs
"------------------------------------------------------------------------------
set switchbuf=usetab
nnoremap <F4> :sbnext<CR>
nnoremap <S-F4> :sbprevious<CR>

"------------------------------------------------------------------------------
" searching
"------------------------------------------------------------------------------
set ignorecase        " case insensitive
set smartcase         " use case if any caps used
set incsearch         " show match as search proceeds
set hlsearch is       " highlight matches
set inccommand=split  " Show interactive preview of substitute changes
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
" undo hlsearch

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
nmap <F7> mzgg=G`z
" auto indent the whole file and keep your cursor in the last position

"------------------------------------------------------------------------------
" folding
"------------------------------------------------------------------------------
set foldenable          " enable fold
set foldcolumn=4        " show column indent
set foldmethod=indent   " indentation method

"------------------------------------------------------------------------------
" swap, undo and backup
"------------------------------------------------------------------------------
set undofile
set undodir=$HOME/.local/share/nvim/undo
set noswapfile
set nobackup
set nowritebackup

"------------------------------------------------------------------------------
" code environments
"------------------------------------------------------------------------------
"
" Python
let g:python3_host_prog = '/bin/python3'
let g:python2_host_prog = '/bin/python2'
"
" Rust
let g:rust_clip_command = 'xclip -selection clipboard'
"
" Clear whitespaces
nnoremap <silent> <F9> <Esc>:%s/\s\+$//e<CR>
"
"Insert timestamp
inoremap <F10> <C-R>=strftime("%d/%m/%Y %H:%M")<CR>
"
" Copying to X11 primary selection with the mouse
vnoremap <LeftRelease> "*ygv


