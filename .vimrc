set cursorline
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
" Enable loading additional vimrc from current directory
set exrc

set errorformat=%f:%l:%c:%m
set errorformat^=%-GERROR:\ %f:%l:%c:%m

" fzf.vim ----------------------------------------------------------------------------------------
" $ git clone https://github.com/junegunn/fzf.vim.git ~/.vim/bundle/fzf.vim
" $ brew install fd
" For linux: set rtp+=~/.fzf
" For mac: rtp+=/usr/local/opt/fzf
set rtp+=/usr/local/opt/fzf
set runtimepath^=~/.vim/bundle/fzf.vim
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
