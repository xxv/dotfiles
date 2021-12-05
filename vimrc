call pathogen#infect()

filetype plugin on
"filetype indent on
filetype plugin indent on
syntax on
set is
set autoindent

" Going to try it again 2017-09-21
set mouse=a
set clipboard=unnamedplus

" First make sure nothing is written to ~/.viminfo while editing
" an encrypted file.
autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
" We don't want a swap file, as it writes unencrypted data to disk
autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
autocmd BufReadPre,FileReadPre      *.gpg set noundofile

" python flavour
"""""set softtabstop=4
autocmd FileType     python set expandtab
autocmd FileType     python set smarttab

autocmd FileType      python set shiftwidth=4
autocmd FileType      python set tabstop=8
autocmd FileType      python set softtabstop=4

autocmd BufRead     *.lua set expandtab
autocmd BufRead     *.lua set smarttab

autocmd BufRead      *.lua set shiftwidth=4
autocmd BufRead      *.lua set tabstop=8
autocmd BufRead      *.lua set softtabstop=4

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" arduino flavour
autocmd BufRead      *.ino set tabstop=2
autocmd BufRead      *.ino set softtabstop=2
autocmd BufRead      *.ino set shiftwidth=2
autocmd BufRead      *.ino set syntax=cpp
autocmd BufRead      *.ino set expandtab
autocmd BufRead      *.ino set smarttab

" arduino flavour, oldskool
autocmd BufRead      *.pde set tabstop=2
autocmd BufRead      *.pde set softtabstop=2
autocmd BufRead      *.pde set shiftwidth=2
autocmd BufRead      *.pde set syntax=cpp

" openscad
autocmd FileType    openscad set tabstop=2
autocmd FileType    openscad set softtabstop=2
autocmd FileType    openscad setlocal shiftwidth=2
autocmd FileType    openscad set expandtab
autocmd FileType    openscad set smarttab

" XML
autocmd BufRead     *.xml set tabstop=4
autocmd BufRead     *.xml set softtabstop=4
autocmd BufRead     *.xml set shiftwidth=4
autocmd BufRead     *.xml set expandtab
autocmd BufRead     *.xml set smarttab

" markdown
autocmd BufRead      *.md set syntax=markdown
autocmd BufRead      *.md set textwidth=100

" as suggested by http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set nocompatible
set encoding=utf-8
set scrolloff=3

" make regexps behave like Perl/Python
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set gdefault

set incsearch
set showmatch
set hlsearch
set ttyfast
set lazyredraw " to speed up laggy scrolling
set relativenumber
set number

" for encrypted files, ensure that the undo history doesn't leak data


" show status line at the bottom, include cursor position.
set ruler
set laststatus=2

" appearance
"
set background=dark

:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

let g:solarized_termtrans=1
let g:solarized_underline=0
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
colorscheme solarized

:highlight ExtraWhitespace ctermbg=red guibg=red
:highlight clear SpellBad
:highlight SpellBad cterm=underline ctermfg=red

" Show trailing whitespace and spaces before a tab:
:match ExtraWhitespace /\s\+$\| \+\ze\t\|[^\t]\zs\t\+/

"let g:syntastic_java_javac_config_file_enabled=1

" when not in view mode, save some extra state about the buffer
if ! &ro
    set spell
    set undofile

    " saves folds + cursor position upon quit; loads folds on open
    au BufWinLeave ?* mkview
    au BufWinEnter ?* silent loadview
" when in view mode, don't save any state
else
    autocmd BufReadPre,FileReadPre      ?* set viminfo=
    autocmd BufReadPre,FileReadPre      ?* set noswapfile
    autocmd BufReadPre,FileReadPre      ?* set noundofile
endif

:let mapleader = " "

let g:syntastic_python_checkers = ['flake8']
