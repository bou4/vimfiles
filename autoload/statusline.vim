" Return '[\s]' if trailing space is detected, '' otherwise
function! statusline#trailing_space() abort
    if (!exists("b:statusline_trailing_space_warning"))
        if (!&modifiable)
            let b:statusline_trailing_space_warning = ''

            return b:statusline_trailing_space_warning
        endif

        if (search('\s\+$', 'nw') != 0)
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif

    return b:statusline_trailing_space_warning
endfunction

