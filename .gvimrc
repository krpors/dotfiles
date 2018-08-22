colorscheme molokai
" set guifont=DejaVu\ Sans\ mono\ 11
set guifont=noto\ mono\ 11
menu &Custom.Delete\ all\ buffers :bufdo :bdelete<CR>
menu &Custom.Remove\ trailing\ whitespace :RemoveTrailingWhiteSpace<CR>
menu &Custom.Indent\ JSON :JsonIndent<CR>
vmenu &Custom.Text\ operations.Sort\ alphabetically :!sort<CR>
vmenu &Custom.Text\ operations.Unique\ occurences :!sort \| uniq<CR>

" Hide toolbars
set guioptions-=T
