set cursorline
set laststatus=2
set hlsearch
set incsearch
set scrolloff=3
set shiftwidth=4
set tabstop=4
set expandtab
set colorcolumn=100
set showcmd
syntax enable
filetype indent on
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set whichwrap+=<,>
set backspace=indent,eol,start
set autowrite
set autoread
set grepprg=ag\ --nogroup\ --nocolor\ --ignore=tags\ --ignore=*.ipynb
set undofile
set undodir=~/.vimundo
color my_scheme
"set exrc

set errorformat=%f:%l:%c:\ error:\ %m
set errorformat^=%f:%l:%c:\ fatal\ error:\ %m
set errorformat^=%-G%f:%l:%c:\ warning:\ %m
set errorformat^=%-G%f:%l:%c:\ note:\ %m
set errorformat^=%-GERROR:\ %f:%l:%c:\ C++\ compilation\ of\ rule
set errorformat^=%-GERROR:\ %f:%l:%c:%m
set errorformat^=%-GDEBUG:\ %f:%l:%m
set errorformat^=%-GWARNING:\ %f:%l:%m

" fzf.vim ---------------------------------------------------------------------
" $ brew install fd
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
" For linux: 'dir': '~/.fzf'
" For mac 'dir': '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

nnoremap <C-P> :Files<CR>
nnoremap <Leader>] :Buffers<CR>
nnoremap <Leader>pf :!bazel run //:ruff -- format %<CR>
nnoremap <Leader>le o\begin{equation}<CR>\end{equation}<CR><ESC>kO

" clang-format ----------------------------------------------------------------
" $ brew install vim # for python3 support
" :map <C-K> :py3f ~/.vim/clang-format.py<cr>
function! Formatonsave()
  let l:formatdiff = 1
  py3f ~/.vim/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

" remove trailing whitespace --------------------------------------------------
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
nnoremap <Leader>ws :call TrimWhitespace()<CR>
