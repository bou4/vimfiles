" --------------------------------------------------------------
" Plugin list
" --------------------------------------------------------------
call plug#begin()

" A dark theme
Plug 'dracula/vim', { 'as': 'dracula' }
" A tree explorer plugin
Plug 'scrooloose/nerdtree'
" A Git wrapper
Plug 'tpope/vim-fugitive'
" A plugin of NERDTree showing Git status
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" --------------------------------------------------------------
" General settings
" --------------------------------------------------------------

"" Color scheme
" Load color scheme dracula
colorscheme dracula

"" Terminal options
" Use 24-bit color in terminal
set termguicolors

"" GUI options
if has('gui_running')
    " List of fonts which will be used for the GUI version of Vim
    set guifont=Monospace\ 11

    " No menubar
    set guioptions-=m
    " No toolbar
    set guioptions-=T
    " No right-hand scrollbar
    set guioptions-=r
    " No left-hand scrollbar when there is a vertically split window
    set guioptions-=L
endif

"" Line numbers
" Show the line number in front of the line with the cursor
set number
" Minimal number of columns to use for the line number
set numberwidth=6
" Show the line number relative to the line with the cursor in front of each line
set relativenumber

"" Indentation
" Copy indent from current line when starting a new line
set autoindent
" Use the appropriate number of spaces to insert a <Tab>
set expandtab
" Round indents to multiple of 'shiftwidth'
set shiftround
" Number of spaces to use for each step of (auto)indent
set shiftwidth=4
" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4

"" Statusline
" Always show statusline
set laststatus=2

" Clear status line
set statusline=
" Path to file in the buffer
set statusline+=%f
" Help buffer flag
set statusline+=%(\ %h%)
" Modified flag
set statusline+=%(\ %m%)
" Readonly flag
set statusline+=%(\ %r%)
" Current Git branch
set statusline+=%(\ %{fugitive#statusline()}%)
" Right align
set statusline+=%=
" Percentage through file
set statusline+=%(\ %p%%%)
" Current line and current column
set statusline+=%(\ %l:%c%)

"" Tabline
" Always show tabline
set showtabline=2

"" Command line
" Number of screen lines to use for the command line
set cmdheight=2

"" Other
" Allow backspacing over autoindent, line breaks and the start of insert
set backspace=indent,eol,start
" Show (partial) command in the last line of the screen
set showcmd
" Buffer becomes hidden when it is abandoned
set hidden
" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5
" Minimal number of screen columns to keep to the left and to the right of the cursor
set sidescrolloff=5
" Do not wrap lines
set nowrap
" Show special characters
set listchars=eol:¶,tab:→\ ,space:·,precedes:<,extends:>
" Command line completion operates in an enhanced mode
set wildmenu

" --------------------------------------------------------------
" Plugin settings
" --------------------------------------------------------------

"" NERDTree
" Disable the 'Bookmarks' label 'Press ? for help' text
let g:NERDTreeMinimalUI=1
" Define the value for 'statusline' in NERDTree windows
let g:NERDTreeStatusline='[NERDTree]'

"" NERDTree Git plugin
let g:NERDTreeIndicatorMapCustom = {
            \ 'Modified'  : 'M',
            \ 'Staged'    : 'S',
            \ 'Untracked' : 'Unt',
            \ 'Renamed'   : 'R',
            \ 'Unmerged'  : 'Unm',
            \ 'Deleted'   : 'De',
            \ 'Dirty'     : 'Di',
            \ 'Clean'     : 'C',
            \ 'Ignored'   : 'I',
            \ 'Unknown'   : 'Unk'
            \ }

" --------------------------------------------------------------
" Mappings
" --------------------------------------------------------------

"" Leader
let mapleader=' '

"" Toggle list mode
nnoremap <silent> <leader>l :set list!<CR>
"" Toggle NERDTree
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
"" Open terminal 
nnoremap <silent> <leader>t :terminal<CR>

"" Window movement
nnoremap <silent> <C-h> :call window_move#window_move('h')<CR>
nnoremap <silent> <C-j> :call window_move#window_move('j')<CR>
nnoremap <silent> <C-k> :call window_move#window_move('k')<CR>
nnoremap <silent> <C-l> :call window_move#window_move('l')<CR>

" --------------------------------------------------------------
" Autocommands
" --------------------------------------------------------------

"" NERDTree
" Activate NERDTree when Vim starts up
augroup VimStartup
    autocmd!
    autocmd VimEnter * NERDTree
augroup end

