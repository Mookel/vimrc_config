
"set tags
set autochdir
set tags=tags;

"set tabs
set ts=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set expandtab

" CUDA
au BufNewFile,BufRead *.cu set filetype=cuda
au BufNewFile,BufRead *.cuh set filetype=cuda
syntax on

"file auto check
filetype on

"syntax on
syntax on

"auto recover position
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"highlight search
set hlsearch

"match brace
set showmatch

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
