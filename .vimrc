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
set grepprg=ag\ --nogroup\ --nocolor\ --ignore=tags
set undofile
set undodir=~/.vimundo
set exrc

set errorformat=%-Gf:%l:%c:\ warning:\ %m
set errorformat^=%f:%l:%c:\ error:\ %m
set errorformat^=%-GERROR:\ %f:%l:%c:%m
set errorformat^=%-GDEBUG:\ %f:%l:%m
set errorformat^=%-GWARNING:\ %f:%l:%m

" fzf.vim ----------------------------------------------------------------------------------------
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

" clang-format -----------------------------------------------------------------------------------
" $ brew install vim # for python3 support
:map <C-K> :py3f ~/.vim/clang-format.py<cr>
function! Formatonsave()
  let l:formatdiff = 1
  py3f ~/.vim/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
