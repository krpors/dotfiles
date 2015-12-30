colorscheme molokai
set guifont=DejaVu\ Sans\ mono\ 10
menu &Custom.Delete\ all\ buffers :bufdo :bdelete<CR>
menu &Custom.Remove\ trailing\ whitespace :RemoveTrailingWhiteSpace<CR>
vmenu &Custom.Text\ operations.Sort\ alphabetically :!sort<CR>
vmenu &Custom.Text\ operations.Unique\ occurences :!sort \| uniq<CR>

" Hide toolbars
set guioptions-=T
