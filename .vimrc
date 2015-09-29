" =============================================================================
" VUNDLE SPECIFICS
" =============================================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on


" =============================================================================
" CUSTOM SETTINGS
" =============================================================================

" Better colorscheme for terminals
colorscheme koehler

" Tab stops etc.
set noexpandtab
set shiftwidth=4
set tabstop=4

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

" =============================================================================
" KEY MAPPINGS 
" =============================================================================

" Map control b to execute makefile.
map <C-b> :make!<CR>
" Execute the current file by F12. Useful for scripts like python/bash.
map <F12> :!./%<CR>
" Map the NERDTree to \t
map \t :NERDTreeToggle<CR>
" Omnicompletion set to ctrl space plx
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" =============================================================================
" COMMANDS
" =============================================================================
command XmlFormat %!xmllint --format -
