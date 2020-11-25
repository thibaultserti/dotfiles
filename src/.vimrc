set nocompatible
filetype off

"Delete trailing spaces"
:autocmd Syntax * syn match TrailWhitespace /\s\+$\| \+\ze\t/
"Line number"
set number
set nu
set hls
set is
set background=dark
syntax on
set showcmd
set mouse=a
set tabstop=2
