function! statusline#trailing_space() abort
    if (!exists("b:statusline_trailing_space_warning"))
        " Check if current buffer is modifiable
        if (!&modifiable)
            " Do not check for trailing spaces
            let b:statusline_trailing_space_warning = ''

            return b:statusline_trailing_space_warning
        endif

        " Check for trailing spaces
        let l:line_number = search('\s\+$', 'nw')

        if (l:line_number != 0)
            let b:statusline_trailing_space_warning = '[Trailing(' . l:line_number . ')]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif

    return b:statusline_trailing_space_warning
endfunction

