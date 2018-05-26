
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

function! Formatonsave()
  let l:formatdiff = 1
  pyf $HOME/local/clang-format.py
endfunction
autocmd BufWritePre *.hpp,*.h,*.cc,*.cpp call Formatonsave()

"netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 20

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
