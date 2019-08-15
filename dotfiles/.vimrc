"
" File: .vimrc
" Author: Colps
" Github: https://github.com/colpshift
" Description: vim configuration file
" Last Modified: June 14, 2019
"

"------------------------------------------------------------------------------
" start settings
"------------------------------------------------------------------------------
set nocompatible
syntax on
filetype plugin indent on
set fileformat=unix
set autoread			" Automatically re-read files if unmodified inside Vim.
set confirm             " Display confirmation dialog when closing unsaved file.
set nomodeline          " Ignore file’s mode lines.

"------------------------------------------------------------------------------
" Performance
"------------------------------------------------------------------------------
set complete-=i		" Limit the files searched for auto-completes.
set lazyredraw		" Don’t update screen during macro and script execution.

"------------------------------------------------------------------------------
" Text Rendering
"------------------------------------------------------------------------------
set display+=lastline	" Always try to show a paragraph’s last line.
set encoding=utf-8		" Use an encoding that supports unicode.
set linebreak			" Avoid wrapping a line in the middle of a word.
set scrolloff=1			" Number screen lines keep above and below cursor.
set sidescrolloff=5		" Number screen columns keep  left and right cursor.
set wrap				" Enable line wrapping.

"------------------------------------------------------------------------------
" Auto commands
"------------------------------------------------------------------------------
"au BufWinLeave * mkview				" save folds
"au VimEnter * call RestoreFolds()		" restore folds

"------------------------------------------------------------------------------
" Scripts
"------------------------------------------------------------------------------
" Restore Folds
"function RestoreFolds()
"    if @% == ""
"		set encoding=utf-8
"    elseif filereadable(@%) == 0
"		set encoding=utf-8
"		elseif line('$') == 1 && col('$') == 1
"		set encoding=utf-8
"	else
"		au BufWinEnter * silent loadview
"	endif
"endfunction

"------------------------------------------------------------------------------
" plugins package manager - vim-plug
"------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-plug'
        " plugin manager
    "---------------------------  
	Plug 'morhetz/gruvbox'
        " vim color theme
    Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
        " status/tabline for vim
    "---------------------------  
    Plug 'RRethy/vim-illuminate'
        " automatically highlighting other uses of the word under the cursor
	Plug 'TaDaa/vimade'
        " fades your inactive buffers and preserves your syntax highlighting
	Plug 'luochen1990/rainbow'
        " shows different levels of parentheses in different colors.
    Plug 'kshenoy/vim-signature'
        " place, toggle and display marks.
    "---------------------------  
    Plug 'justinmk/vim-sneak'
        " Jump to any location specified by two characters
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        " command-line fuzzy finder 
    Plug 'junegunn/fzf.vim'
        " Things you can do with fzf and Vim.
    Plug 'alok/notational-fzf-vim'
        " searching for a note and creating one are the same operation
    "---------------------------  
    Plug 'ervandew/supertab'
        " Perform all your vim insert mode completions with Tab
    Plug 'w0rp/ale'
        " Check syntax in Vim asynchronously and fix files
	Plug 'Valloric/YouCompleteMe'
        " code-completion engine for Vim
	Plug 'tenfyzhong/CompleteParameter.vim'
        " Complete parameter after select the completion
    Plug 'kkoomen/vim-doge'
        " Generate proper code documentation skeletons with a single keypress
	Plug 'google/yapf'
        " formatter for Python files 
    "---------------------------  
	Plug 'SirVer/ultisnips'
        " snippet solution for Vim
	Plug 'honza/vim-snippets'
        " snippets for vim
	"---------------------------  
    Plug 'francoiscabrol/ranger.vim'
        " Ranger integration
    Plug 'felipec/notmuch-vim'
        " mail client interface, utilizing the notmuch framework.
call plug#end()

"------------------------------------------------------------------------------
" plugins configuration
"------------------------------------------------------------------------------
" rainbow
let g:rainbow_active = 1
" sneak
    let g:sneak#label = 1
    map f <Plug>Sneak_s
    map F <Plug>Sneak_S
" Illuminate
    " Time in milliseconds (default 250)
    let g:Illuminate_delay = 250
    " blacklist
    let g:Illuminate_ftblacklist = ['nerdtree']
    " whitelist by groups
    "let g:Illuminate_ftHighlightGroups = {
    "    \ 'vim': ['vimVar', 'vimString', 'vimLineComment',
    "    \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc']
    "    \ }
" gruvbox
    let g:gruvbox_contrast_dark = 'medium'
    let g:gruvbox_invert_tabline = '1'
    let g:gruvbox_invert_indent_guides = '1'
    let g:gruvbox_improved_warnings ='1'
" vimade
    let g:vimade = {}
    let g:vimade.fadelevel = 0.3
" airline
    let g:airline_theme='gruvbox'
    let g:airline_highlighting_cache = 1
" spell
    "set spell
    "set spelllang=en-US
    "set spellsuggest=best,5
    "let s:c=",underline"
    "let spell_auto_type="text,doc,mail,"
" YCM
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'
" UltiSnips
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" ALE
    let g:ale_enabled = 0
    let g:ale_completion_enabled = 1
    let g:ale_sign_column_always = 1
    let g:ale_set_highlights = 1
    let g:ale_echo_cursor = 1
    let g:ale_cursor_detail = 1
    let g:ale_set_quickfix = 1
    let g:ale_set_loclist = 0
    let g:airline#extensions#ale#enabled = 1
    let g:ale_list_window_size = 5
    let g:ale_lint_on_text_changed = 1
    let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
    let g:ale_enabled = 1
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
" Notational FZF
let g:nv_search_paths = ['~/Documents']
" Supertab 
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

"------------------------------------------------------------------------------
" mapping and abbreviations
"----------------------------------------------'--------------------------------
" mapleader
map <Space> <Leader>
" abbreviations
ab ~/ $HOME
" run :w!! command (type fast), to save ready only files.
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" auto indent the whole file and keep your cursor in the last position
nmap <leader>ia mzgg=G`z
" undo hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
" insert timestamp
inoremap <F10> <C-R>=strftime("%d/%m/%Y %H:%M")<CR>
" complete parameters
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

"------------------------------------------------------------------------------
" python - programming
"------------------------------------------------------------------------------
" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" enable all python highlight
let python_highlight_all=1

"------------------------------------------------------------------------------
" interface
"------------------------------------------------------------------------------
set shortmess=atIc		" Don’t show the intro message when starting Vim
set number
set relativenumber
set cursorline
set nostartofline		" Don’t reset cursor start of line when moving around.
set clipboard+=unnamed  " to use clipboard
set ruler               " right side of the status line at the bottom
set showmode            " change the color in according of mode
set mouse=a             " allow mouse clicks to change cursor position
set showmatch           " highlight matching [{()}]
set wildmenu            " expand the menu
set showcmd             " show command in bottom bar
set colorcolumn=+1      " color de last column to wrap.
set textwidth=79        " set width for text
set winwidth=100        " set the minimal width of the current window.
set noerrorbells		" Disable beep on errors.
set visualbell			" Flash the screen instead of beeping on errors.
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
set tabstop=4           " Python default
set shiftwidth=4        " The amount to block indent when using
set shiftround			" Round the indentation to earest multiple shiftwidth.
set softtabstop=4       " Causes backspace to delete 4 spaces converted TAB
set smarttab            " Uses shiftwidth instead of tabstop at start of lines
set expandtab			" Replaces a TAB with spaces--more portable
set backspace=eol,start,indent	" Make sure backspace works in insert mode

"------------------------------------------------------------------------------
" folding
"------------------------------------------------------------------------------
set foldenable			" enable fold
set foldmethod=indent	" fold based on indent level
set foldcolumn=3		" show column indent

"------------------------------------------------------------------------------
" swap, undo and backup
"------------------------------------------------------------------------------
set swapfile
set directory=$HOME/.vim/swaps/
set undofile
set undodir=$HOME/.vim/undo/
set backup
set backupdir=$HOME/.vim/backups/

# test
