set cursorline
hi CursorLine   cterm=NONE ctermbg=darkgray guibg=darkgray
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

set errorformat^=ERROR:\ %f:%l:%c:%m

"  Ctrl-P
"  git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"  use ag to search
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"let g:ctrlp_regexp = 1
"let g:ctrlp_max_files = 0
"let g:ctrlp_use_caching = 0

" fzf.vim
" git clone https://github.com/junegunn/fzf.vim.git ~/.vim/bundle/fzf.vim
set runtimepath^=~/.vim/bundle/fzf.vim
set rtp+=~/.fzf
nnoremap <C-P> :Files<CR>
nnoremap ;; :Buffers<CR>

" Enable loading additional vimrc from current directory
set exrc


" clang-format
" C-k formats current line
" :map <C-K> :py3f ~/.vim/clang-format.py<cr>
function! Formatonsave()
  let l:formatdiff = 1
  py3f ~/.vim/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
