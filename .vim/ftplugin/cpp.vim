if has("win32")
    command! -nargs=* Run !cd "%:p:h" &
                    \ g++ -std=c++11 -o "%:t:r" "%:t" <args> &
                    \ echo[ & "%:t:r" 
else
    command! -nargs=* Run VimuxRunCommand("clear && cd \"" .expand("%:p:h")
     \ . "\" && g++ -std=c++11 -o " .expand("%:t:r") ." " .expand("%:t")
     \  ." <args> && tmux select-pane -t bottom" ." && tmux resize-pane -U 20"
     \ ." && tmux split-window -h \"./" .expand("%:t:r")
     \ ." && read -rep $'\n\nPress any key to continue...' && tmux resize-pane -D 20\" && clear")
endif

" Opens corresponding '.c' file.
" For some reason, '.h' files have a filetype of 'cpp'.
nnoremap <Leader>c :e <C-r>=expand('%:r')<CR>.c<CR>
nnoremap <Leader><Leader>c :e <C-r>=expand('%:r')<CR>.cc<CR>
nnoremap <Leader>h :e <C-r>=expand('%:r')<CR>.h<CR>
