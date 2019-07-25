function! configuration#edit() abort
    " If we are not editing the configuration
    if (expand('%:p') != $MYVIMRC)
        " Edit configuration
        edit $MYVIMRC
    " If we are editing the configuration
    else
        " Save configuration
        write
        " Load configuration
        source $MYVIMRC
        " Delete buffer
        bdelete
    endif
endfunction

