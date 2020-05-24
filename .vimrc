"""""""""""""""""""""
" VIM CONFIGURATION "
"""""""""""""""""""""

""" REQUIRED """
syntax on
set nocompatible
set nowrap
set encoding=utf8

""" PLUGIN MANAGEMENT - VUNDLE """
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" PLUGINS GO BELOW THIS LINE "

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-bufferline'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'junegunn/limelight.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

"""""""""""""""""
" CONFIGURATION "
"""""""""""""""""

" sourcing configuration from working dir
set exrc
set secure

" clipboard
set clipboard=unnamedplus

" linenumbers
set number
set relativenumber
set ruler

" matching
set showmatch
set ignorecase
set smartcase
set incsearch

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

" folding
set nofoldenable

" indent
set autoindent

" status
set laststatus=2

" highlights
hi MatchParen ctermbg=Green
set colorcolumn=80
hi ColorColumn ctermbg=Grey ctermfg=White
hi Visual ctermbg=Grey ctermfg=White
highlight Comment cterm=italic

" theming
"set t_Co=256
let &t_ut=''            " for kitty terminal

" backup
set noswapfile
set noundofile

" show trailing whitepace and spaces before a tab
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

"""""""""""
" PLUGINS "
"""""""""""

" INDENTLINE "
set list lcs=tab:\.\ 

" LIMELIGHT "
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_priority = -1

"AIRLINE"
let g:airline_theme='sol'
"let g:airline#extensions#tabline#enabled = 1

"""""""""""""""
" DEVELOPMENT "
"""""""""""""""

" C
let &path.="src/include,/usr/include/AL,"
set makeprg=make\ -C\ ../build\ -j9
autocmd FileType c nnoremap <F1> :!clear; gcc -o a.out % && ./a.out<cr>
autocmd FileType c nnoremap <F2> :!clear; ./a.out<cr>

" Python
autocmd FileType python nnoremap <F1> :!clear; python %<cr>

" Markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

""""""""""""
" MAPPINGS "
""""""""""""

" disable ex mode
nnoremap Q <Nop>

nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
