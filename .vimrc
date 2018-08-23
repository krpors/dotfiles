" Before anything else (like loading plugins) we will set our <Leader>
" key to the spacebar. This character is never used in normal mode anyway.
let mapleader = " "

" =============================================================================
" VUNDLE SPECIFICS
"
" =============================================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'sirver/ultisnips'

call vundle#end()
filetype plugin indent on

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" =============================================================================
" CUSTOM VIM ONLY SETTINGS
" =============================================================================

" Better colorscheme for terminals (256 colors)
colorscheme spacegray

" Omnicompletion cruft. No preview window, and don't insert text by default,
" until we choose to do so.
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=noinsert
set tags+=~/.vim/tags/usr_include.tags

" Tab stops etc.
set noexpandtab
set shiftwidth=4
set tabstop=4

set autowrite " for :make etc.
set nowrap
set ignorecase " smart-case searching
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
set formatoptions+=j  " join comments properly

match ErrorMsg '\s\+$' " trailing whitespace are highlighted as errors

" Italicize comment strings in files.
highlight Comment cterm=italic

" Allow normal use of backspace.
set backspace=eol,indent,start
" Apparently for Doxygen style comments:
set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,bO:///,O://
" Save only these things in sessions:
set sessionoptions=blank,buffers,folds,help,options,tabpages,winsize,sesdir

" Always display tabs, displayed differently using some fancy glyphs
set list
set listchars=tab:»\ ,trail:~
" remember this one: ·

" Ignore files from wildcard search (mostly binaries)
set wildignore+=*.o,*.so,*.swp,*.zip,*.tar.gz,*.bin,*.exe,*.d

" =============================================================================
" KEY MAPPINGS
" =============================================================================

" Map control b to execute makefile.
map <C-b> :make!<CR>
" Execute the current file by F12. Useful for scripts like python/bash.
map <F12> :!./%<CR>
" In insert mode, ctrl-space is omnicompletion. Requires also the mapping of
" C-@ to interpret the space char correctly.
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
map <Leader>t :NERDTreeToggle<CR>

" =============================================================================
" COMMANDS
" =============================================================================
command! XmlFormat %!xmllint --format -
command! RemoveTrailingWhiteSpace %s/\s\+$//
command! JsonIndent %!python -m json.tool
command! -range FoldText <line1>,<line2>!fold -s
