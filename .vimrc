set encoding=utf-8
set fileencodings=utf-8
set fileencodings=utf-8,chinese,latin-1
set termencoding=utf-8
set nu
set shiftwidth=4
set textwidth=100
set nocompatible              " be iMproved, required
set history=700
set term=xterm

" Set to auto read when a file is changed from the outside
set autoread

" set 7 lines to the cursor - when moving vertically using j/k
set so=7


" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc


"Always show current position
set ruler

" Don't redraw while executing macros (good performance config)
set lazyredraw

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'nvie/vim-flake8'
call vundle#end()            " required
filetype plugin indent on    " required
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
map ; :
nmap <F6> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F3> :set mouse=v<CR>
nmap <F4> :set mouse=a<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set expandtab
" Be smart when using tabs ;)
set smarttab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set hlsearch                " 搜索时高亮显示被找到的文本
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&fileencoding}\ %c:%l/%L%)\
set backspace=indent,eol,start
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set list
set listchars=tab:>-,trail:-
set matchtime=2             " 短暂跳转到匹配括号的时间
set matchpairs+=<:>                     "增加尖括号匹配
au BufNewFile,BufRead *.go set softtabstop=8 | set shiftwidth=8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=100 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
au FileType go set softtabstop=8 | set shiftwidth=8
" set ignorecase smartcase    "搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
autocmd StdinReadPre * let s:std_in=1
autocmd BufWritePost *.py call Flake8()
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
set undodir=~/.vim/undodir  "持久性undo in version7.3
set undofile
set undolevels=1000 "可被undo的次数
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
let python_highlight_all=1

"记住上次光标位置
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
""窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
""时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
let g:syntastic_check_on_open = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
"set mouse=a
let mapleader=","
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>e <Plug>(go-rename)
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
set t_Co=256
let g:rehash256 = 1
colorscheme molokai

" easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" tagbar
" let g:tagbar_left = 1
" let g:tagbar_vertical = 20
"

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%



" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
