"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ZT Vim Config
" -----------------------------------------------------------------------------
" Plugins_Sesstion
" Global_Setting_Session
" Interface_Setting_Session
" Edit_setting_Session
" Navigation_Setting_Session
" Search_Setting_Session
" Filetype_And_Syntax_Setting_Session
" Developpeur_settion_Settion
" Custom_Functions_Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ---------------------------------------------------
" Plugins_Sesstion
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'tpope/vim-sensible'

" The NERD tree allows you to explore your filesystem and to open files and
" directories.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

"
Plug 'gcmt/taboo.vim'

" A Vim plugin which shows a git diff in the 'gutter' (sign column)
Plug 'airblade/vim-gitgutter'

" view git in vim
Plug 'tpope/vim-fugitive'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" mouse
" Plug 'nvie/vim-togglemouse'

" vim-expand-region is a Vim plugin that allows you to visually select
" increasingly larger regions of text using the same key
" Plug 'terryma/vim-expand-region'

" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Surround.vim is all about "surroundings": parentheses, brackets, quotes
Plug 'tpope/vim-surround'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" Run your favorite search tool from Vim, with an enhanced results list.
" Plug 'mileszs/ack.vim'

" LustyExplorer is a fast and responsive way to manage files and buffers in Vim
Plug 'vim-scripts/LustyExplorer'

" Vim plugin that displays tags in a window
" mayneedtoinstallCTAGS
Plug 'https://github.com/majutsushi/tagbar'

" EasyMotion provides a much simpler way to use some motions in vim
Plug 'easymotion/vim-easymotion'

" System copy provides vim mappings for copying / pasting text to the os
" specific clipboard
Plug 'christoomey/vim-system-copy'

" Auto trigger complete popup menu
" !!!!! Install CMake then use this to real install
" cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
" may use this to change python lib:
" export EXTRA_CMAKE_ARGS="-DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so.1"
" may need to install vim-nox
Plug 'Valloric/YouCompleteMe'

" Most Recently Used (MRU) Vim plugin
Plug 'yegappan/mru'

" SnipMate aims to provide support for textual snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Maintains a history of previous yanks, changes and deletes
" Plug 'vim-scripts/YankRing.vim'

" Comment stuff out. Use gcc to comment out a line (takes a count)
Plug 'https://github.com/tpope/vim-commentary'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" This plugin is used for displaying thin vertical lines at each indentation
" level for code indented with spaces
Plug 'Yggdroot/indentLine'

" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" emmet-vim is a vim plug-in which provides support for expanding
" abbreviations similar to emmet.
" ex: div>p#foo$*3>a <c-y>,
Plug 'mattn/emmet-vim'

" Colors-----------------------------------------------------
" !!!!! need to copy ./vim/plug/vim-colorschemes/colors to ./vim/colors
Plug 'flazz/vim-colorschemes'

" Syntax for languages----------------------------------------
" Syntax and indent files for Swift
Plug 'https://github.com/keith/swift.vim'
Plug 'leafgarland/typescript-vim'

" syntax check
Plug 'scrooloose/syntastic'

" ruby syntax
Plug 'vim-ruby/vim-ruby'

" rails syntax
Plug 'tpope/vim-rails'

" Other-------------------------------------------------------
Plug 'vimwiki/vimwiki'

" Add plugins to &runtimepath
call plug#end()

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Customs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global_Setting_Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden

" key , for leader key
let mapleader = ','

" Switch CWD to the directory of the open buffer:
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>t :sh<cr>

" ctrl-c copy with mouse
:vmap <C-C> "+y

" Swith paste mode
nmap <leader>p :call PasteToggle()<cr>

" Plugin - system copy paste
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface_Setting_Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap H  :call HightLightCursor() <cr>

" air-line custom
" preference
let g:airline_theme="bubblegum"
" let g:airline_theme="understated"
" let g:airline_theme="wombat"
" let g:airline_theme="light"

" enable colors
if ! has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  " set guitablabel=%M\ %t
  set guitablabel=%t
endif
" " feel free to choose :set background=light for a different style
" set background=dark
" preference :)
" colors desert
" colors wombat256mod
colors candycode

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Always show the status line
set laststatus=2

" " Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" longest line display
set cc=80

" Line number display
set nu

" line number relative
set relativenumber

" Plugin - taboo.vim
set guioptions-=e

" Plugin - fugitive
nmap <leader>ge :Gedit <CR>
nmap <leader>gs :Gstatus <CR>
nmap <leader>gb :Gblame <CR>
nmap <leader>gd :Gdiff <CR>
nmap <leader>gl :Glog <CR>
nmap [q :cprev <CR>
nmap ]q :cnext <CR>
nmap <leader>dh :diffget //2 <CR>
nmap <leader>dl :diffget //3 <CR>

" close all panes except current
nmap <leader>o :only <CR>
"""""""""""""" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit_setting_Session
"""""""""""""" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tab space
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

set ai
set si
set wrap

" nmap J :join<CR>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

nmap s <S-s>

" use "key  to comment lines
" vmap " gcc
" nmap " gcc
" Plugin - YankRing setting
" nmap <leader>y :YRShow<CR>

" auto remove trailling space when saving
autocmd BufWritePre * :call StripTrailingWhitespace()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation_Setting_Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin - tagbar setting
" key _ to open tag bar

" Treat long lines as break lines (useful when moving around in them):
" map j gj
" map k gk

nmap _ :TagbarToggle<CR>
let g:tagbar_left = 1

" Plugin - ultra-snip setting
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l


" switch tab
nmap <c-h> gT
nmap <c-l> gt
" nmap <c-D> :tabm<CR>
" nmap <c-F> :tabm -1<CR>

" begin scroll before 4 line
set scrolloff=7

" resize windows
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" map 0 to ^
map 0 ^

" mouse dont copy number line
set mouse=a

nnoremap <Leader>m :call ToggleMouse()<CR>

" Plugin - nerdtree setting
" key + to open nerd tree
" nmap + :NERDTreeToggle<cr>
nmap + <plug>NERDTreeTabsToggle<CR>

" let nerdtree open at right
let g:NERDTreeWinPos = "right"
nmap \ <plug>NERDTreeTabsFind<CR>
" open nerdtree in new tab

" change number line absolute or relative
nmap <leader>L :call NumberToggle()<cr>

" foldings setting
set foldmethod=indent   "fold based on indent
set foldnestmax=10    "deepest fold is 10 levels
set nofoldenable      "dont fold by default
set foldlevel=1       "this is just what i use

" Plugin - MRU setting
nmap <leader>r :MRU<cr>

" move tab to next
nmap <C-j> :call TabMove(-1)<CR>
nmap <C-k> :call TabMove(1)<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search_Setting_Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set magic
set ignorecase
" To highlight all search matches
set hlsearch

" Use space key to research
nmap <Space> /

" Plugin - ctrlp setting
" nmap <c-p> :CtrlP<CR>

" Plugin - easy moiton
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Plugin - LustyExplorer setting
map <Leader>g :LustyBufferGrep<CR>
" LustyExplorer default setting
" Instructions:

"       :LustyFilesystemExplorer
"       :LustyFilesystemExplorerFromHere
"       :LustyBufferExplorer
"       :LustyBufferGrep (for searching through all open buffers)

"       <Leader>lf  - Opens filesystem explorer.
"       <Leader>lr  - Opens filesystem explorer at the directory of the current file.
"       <Leader>lb  - Opens buffer explorer.
"       <Leader>lg  - Opens buffer grep.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype_And_Syntax_Setting_Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax color display
" set syntax=on
syntax enable

set encoding=utf8

" Enable filetype plugins
filetype plugin on
filetype indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Developpeur_settion_Settion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>e :call RunCurrentFile()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom_Functions_Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" relative number line or absolute
function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
  else
    set relativenumber
  endif
endfunc

" toggle paste mode
function! PasteToggle()
  if(&paste == 1)
    set paste!
  else
    set paste
  endif
endfunc

function! ToggleMouse()
  if !exists("s:old_mouse")
    let s:old_mouse = "a"
  endif

  if &mouse == ""
    let &mouse = s:old_mouse
    echo "Mouse is for Vim (" . &mouse . ")"
  else
    let s:old_mouse = &mouse
    let &mouse=""
    echo "Mouse is for terminal"
  endif
endfunction

function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  " if (line("'Z") != line(".")) || (l:chars != col("$"))
  " echo "Trailing whitespace stripped\n"
  " endif
  normal `Z
endfunction

" Move current tab into the specified direction.
"
" @param direction -1 for left, 1 for right.
function! TabMove(direction)
  " get number of tab pages.
  let ntp=tabpagenr("$")
  " move tab, if necessary.
  if ntp > 1
    " get number of current tab page.
    let ctpn=tabpagenr()
    " move left.
    if a:direction < 0
      let index=((ctpn-1+ntp-1)%ntp)
    else
      let index=(ctpn%ntp)
    endif

    " move tab page.
    execute "tabmove ".index
  endif
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("Ag \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function! HightLightCursor()
  set cursorline!
  set cursorcolumn!

  hi cursorline cterm=none ctermbg=237 ctermfg=NONE
  hi cursorcolumn cterm=none ctermbg=237 ctermfg=NONE
endfunction

function! RunCurrentFile()
  let ft = echo &ft
  if &ft == 'vim'
    :so %
  elseif &ft == 'ruby'
    :!ruby %
  elseif (&ft == 'c' || &ft == 'cpp')
    :!g++ %
  elseif &ft == 'sh'
    :!%:p
  endif
endfunction
