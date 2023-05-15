" Global
set number
syntax on
setlocal shiftwidth=4
setlocal tabstop=4

" For html,js,css files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 expandtab
