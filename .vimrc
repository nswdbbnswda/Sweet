call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/LeaderF'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
call plug#end()

set nu
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set mouse=a
set nocompatible       " be iMproved, required
set laststatus=2  
"永远显示状态栏
let g:airline_powerline_fonts = 1  
let g:airline#extensions#tabline#enabled=1    " 开启 tab 栏
set background=dark

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBrace


map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cc'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'go'
        exec "!go build  %"
        exec "!time ./%<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
        exec "!time python3.6 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

map <F6> :call RunMakeFunc()<CR>
func! RunMakeFunc()
    exec "w"
    exec "!cd /home/lichao/lichao/muduo/muduo/net-lichao/build && make"
endfunc

map <F10> :call RunExeFunc()<CR>
func! RunExeFunc()
    exec "w"
    exec "!cd /home/lichao/lichao/muduo/muduo/net-lichao/build && ./main"
endfunc


map <F12> :call RunDebugFunc()<CR>
func! RunDebugFunc()
    exec "w"
    exec "!cd /home/lichao/lichao/muduo/muduo/net-lichao/build && gdb -tui main"
endfunc


highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" 打开vim时,自动打开NERDTree
"autocmd vimenter * NERDTree
" 设置NerdTree打开的快捷键,可自行更改
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>
"map <F3> :set nocuc<CR>
"map <F3> :set cursorcolumn<CR>
map <F3> :set cursorline<CR>
map <F4> :set nocul<CR>
""map <F4> :set nocul cursorline<CR>
set tags=./tags;/
