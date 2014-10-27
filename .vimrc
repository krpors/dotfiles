" This fixes an rtp issue with the Go vim scripts
filetype off
set rtp+=$GOROOT/misc/vim

" For pathogen.vim (https://github.com/tpope/vim-pathogen) to easily
" manage plugin bundles or some shit
call pathogen#infect()

colorscheme solarized

" Some custom commands
command XmlFormat %!xmllint --format -

" No VI compatibility
set nocompatible
set expandtab
set sw=4
set ts=4
set autowrite " for :make etc.
set nowrap
set smartcase
set showmatch
set incsearch
set hlsearch
set nobackup
set noswapfile
set number
set autoindent
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=0

" Allow normal use of backspace.
set backspace=eol,indent,start
" Apparently for Doxygen style comments:
set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,bO:///,O://
" Save only these things in sessions:
set sessionoptions=blank,buffers,folds,help,options,tabpages,winsize,sesdir

" PER FILE TYPE SETTINGS
" Tab stops etc.
autocmd FileType go setlocal noexpandtab


" KEY MAPPINGS
"
" Map control b to execute makefile.
map <C-b> :make!<CR>
" Execute the current file by F12. Useful for scripts like python/bash.
map <F12> :!./%<CR>
" Map the NERDTree to \t
map \t :NERDTreeToggle<CR>
" Omnicompletion set to ctrl space plx
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

filetype plugin indent on
syntax on