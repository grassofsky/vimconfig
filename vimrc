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
Plugin 'tpope/vim-commentary'  " used for commenting content, exp. gcc, gcap, gcgc
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'

Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/goyo.vim'
" Plugin 'scrooloose/syntastic'

Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sirver/UltiSnips'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
" Plugin 'kana/vim-textobj-entire'

" Plugin 'aaronbieber/vim-quicktask'
Plugin 'vimoutliner/vimoutliner'

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

" My setting
syntax enable

if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized

" Shortcut to mute highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Making & trigger the :&& command
nnoremap & :&&<CR>
xnoremap & :&&<CR>

set tabstop=4
set shiftwidth=4
set expandtab

set number
set incsearch
set hlsearch
set wildmode=longest,list
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

let g:solarized_termcolors=256

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

au! BufRead,BufNewFile *.otl    setfiletype votl
