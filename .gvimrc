set guifont=DejaVu\ Sans\ mono\ 10
menu &Custom.Delete\ all\ buffers :bufdo :bdelete<CR>
vmenu &Custom.Text\ operations.Sort\ alphabetically :!sort<CR>
vmenu &Custom.Text\ operations.Unique\ occurences :!sort \| uniq<CR>
