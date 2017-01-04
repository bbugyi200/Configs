" ----------------------------------------------------------------------------
" ---------------------------- PLUGINS ---------------------------------------
source $CONFIG/plugins.vim

filetype plugin indent on
filetype plugin on

" ---------------------- GVim/Vim Specific Configs ---------------------------
if has("gui_running")
    colo desert
    cd $HOME
else
    set background=dark
endif

" --------------------------- SETS AND LETS ----------------------------------
set clipboard=unnamedplus

set number
set colorcolumn=80
set autoindent
set backspace=2
set autochdir
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible

" Allows me to use the mouse
set mouse=a
" An attempt to fix the issue where mouse-clicks cause random output to screen
set ttymouse=sgr

" Allows me to highlight using a colon (:)
set iskeyword+=:

" Sets LaTeX as default for .tex files
let g:tex_flavor = "latex"

" The <Leader> key can be used for extra mappings
let mapleader = ","

" Search Settings
set incsearch
set ignorecase
set smartcase

" Sets minimum size of active split (by percentage)
let &winheight = &lines * 7 / 10

" ---------------------------- SYNTAX ----------------------------------------
syntax on

" Enables syntax highlighting to work properly for certain filetypes
au BufRead,BufNewFile *.nasm set filetype=nasm
au BufRead,BufNewFile *.txt set filetype=txt

" Used to make syntax highlighting more readable when using Linux
" transparent terminal
highlight Constant ctermfg=lightmagenta 

" ----------------------------------------------------------------------------
" ------------------------------ KEY MAPPINGS --------------------------------
" ----------------------------------------------------------------------------

" Allows space to work in Normal-Mode
nnoremap <space> i<space><esc>

" Shortcuts for quiting vim
noremap <Leader>e :quit<CR>

" Shortcuts for saving vim
" NOTE:: Just use ZZ in normal mode to save and quit.
noremap <Leader>s :w<CR>

" Makes enter key work right in Normal mode
nmap <CR> o<Esc>

nmap <C-N> :NERDTree<CR><S-B>
nmap <Leader>z :ZoomWin<CR>
nmap <Leader>p :CtrlPMRU<CR>

""""""""""""""""""""""""""""""
"  Split and Tab Settings  "
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

""""""""""""""""""""""""""""""

" Will execute the 'Run' command which varies based on the file type
nmap <F9> :w<CR>:Run<CR>
imap <F9> <Esc><F9>

nmap <F8> :w<CR>:Run2<CR>
imap <F8> <Esc><F8>

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Sets tmux pane to the current directory
nnoremap <Leader><F12> :call VimuxRunCommand("cd " .expand("%:p:h") ."&& clear")<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" ------------------------------ AUTOS ---------------------------------------

" Turns spellcheck on for certain file extensions
" 2nd line disables the colorcolumn
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt set colorcolumn=
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md set colorcolumn=
autocmd BufRead,BufNewFile *.html setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.html set colorcolumn=

" Automatic rewriting of .vimrc
 autocmd! bufwritepost .vimrc source %
