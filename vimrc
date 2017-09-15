let mapleader=","

" before 
set t_Co=16

" ==============


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/vundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'godlygeek/tabular'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'aklt/plantuml-syntax'
Plugin 'majutsushi/tagbar'
Plugin 'cotol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'LucHermitte/lh-vim-lib'
" Plugin 'LucHermitte/lh-tags'
" Plugin 'LucHermitte/lh-dev'
" Plugin 'LucHermitte/lh-brackets'
" Plugin 'LucHermitte/local_vimrc'
" Plugin 'LucHermitte/searchInRuntime'
" Plugin 'LucHermitte/mu-template'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/stakeholders_vim'
" Plugin 'LucHermitte/alternate-lite'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fholgado/minibufexpl.vim'
" Plugin 'LucHermitte/lh-cpp'
Plugin 'pboettch/vim-cmake-syntax'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" brief Vim common quickkey ------------------------------- {{{

" Vimscript file folder settings
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Copy the current selected word to system clipboard
vnoremap <Leader>y "+y
" Paste the content from system clipboard
nmap <Leader>p "+p

" Goto next window
nnoremap nw <C-W><C-W>
" Jump to right window
nnoremap <Leader>lw <C-W>l
" Jump to left window
nnoremap <Leader>hw <C-W>h
" Jump to up window
nnoremap <Leader>kw <C-W>k
" Jump to below window
nnoremap <Leader>jw <C-W>j

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Enable line number
set number
" Enable increase search
set incsearch
" Enable search highlight
set hlsearch
" Disable current search highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" Enable vim command mode auto compelete
set wildmenu
set wildmode=longest,list
" Highlight curline and curcolumn
" set cursorline
" set cursorcolumn
" Enable syntax
syntax enable

" Set color scheme
" let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Code folder
set foldmethod=syntax
set nofoldenable

" Free you left little finger
inoremap jk <esc>

" Indent
" Auto indent
filetype indent on
" Expand tab as space
set expandtab
" The number of space for one tab
set tabstop=4
" Space for tab in syntax
set shiftwidth=4
" The number of space represents as tab
set softtabstop=4
" }}}

" Plugin related configure ------------------------------- {{{
" Switch file between source and header
nmap <silent> <Leader>sw :FSHere<cr>

" For NERDTreeToggle
nmap <Leader>f1 :NERDTreeToggle<cr>

"ctrlsf.vim search
nnoremap <leader>sp :CtrlSF<CR>

" Minibuffer
map <leader>bl :MBEToggle<CR>
map <leader><C-n> :MBEbn<CR>
map <leader><C-p> :MBEbp<cr>
map <leader><C-d> :MBEbd<cr>

" Content replacement
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" Get current file path in cmd buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" let g:solarized_termcolors=256

" Command for pandoc
function! ToHtml()
    exec 'w'
    exec "!pandoc -s -S --self-contained -c ~/style/simple.css % -o %<.html "
endfunction

:nmap <silent> H :call ToHtml()<CR>

" For UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" for powerline 
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

inoremap <C-Space> <C-x><C-o>

" for tagbar
nmap <f9> :TagbarToggle<CR>

" set backup
set backup
set backupdir=~/.backup

" Generate ctags for cpp
map <C-F12> :!ctags -R --c++kinds=+p --fileds=+iaS --extra=+q .

" Set for ctags
set tags+=~/.tags/**/tags
set tags+=~/.tags/**/**/tags

" clang complete
let g:clang_library_path='/usr/lib/llvm-3.8/lib'

" set path
set path=.,/usr/local/include,/usr/include,./include,../include

" Copy function declaration from a header file into the implementation file.
nmap <F5> "lYml<nowiki>[[</nowiki>kw"cye'l nmap <F6> ma:let @n=@/<CR>"lp==:s/\<virtual\>/\/\*&\*\//e<CR>:s/\<static\>/\/\*&\*\//e<CR>:s/\s*=\s*0\s*//e<CR>:s/(.\{-}\zs=\s*[^,)]\{-1,}\>\ze\(\*\/\)\@!.*)/\/\*&\*\//e<CR>:s/(.\{-}\zs=\s*[^,)]\{-1,}\>\ze\(\*\/\)\@!.*)/\/\*&\*\//e<CR>:s/(.\{-}\zs=\s*[^,)]\{-1,}\>\ze\(\*\/\)\@!.*)/\/\*&\*\//e<CR>:let @/=@n<CR>'ajf(b"cPa::<Esc>f;s<CR>{<CR>}<CR><Esc>kk'

" }}}
