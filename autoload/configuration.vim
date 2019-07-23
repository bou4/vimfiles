function! configuration#edit() abort
    " If we are not editing the configuration
    if (expand('%:p') != $MYVIMRC)
        " Edit configuration
        execute ':edit ' . $MYVIMRC
    " If we are editing the configuration
    else
        " Save configuration
        execute ':write'
        " Load configuration
        execute ':source ' . $MYVIMRC
        " Delete buffer
        execute ':bdelete'
    endif
endfunction

