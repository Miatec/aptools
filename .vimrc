"# VIMRC par Miatec



"# colore la ligne courante 
set cul
hi CursorLine term=none cterm=none ctermbg=15

"# affiche le numéro de ligne
set nu

"# ignore la casse pour les recherches
set ic

"# Ajoute le nom de fichier dans le titre de la console ainsi que sur la ligne de status
set title
set laststatus=2
set statusline+=%F



map <F2> :call ShotcutsToggle()<CR>

let g:quickfix_is_open = 0

function! ShotcutsToggle() 
    if g:quickfix_is_open
        quit
        let g:quickfix_is_open = 0
    else
        40vsp ~/.aptools/vim_shortcuts 
        let g:quickfix_is_open = 1
    endif
endfunction
