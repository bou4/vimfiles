function! window#move(key) abort
    " Save old window
    let l:current_window = winnr()

    " Execute movement
    execute 'wincmd ' . a:key

    " Check if we have changed window
    if (l:current_window == winnr())
        " If not, create a new split
        if (a:key =~# '[hl]')
            wincmd v
        else
            wincmd s
        endif

        " Move to that new split
        execute 'wincmd ' . a:key
    endif
endfunction

