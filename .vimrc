"" General
set showcmd
set wildmenu


set number relativenumber
"set nu rnu	" Show line numbers
set nu nornu	"show solid line numbers
"set showbreak=+++ 	" Wrap-broken line prefix
"set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
"set spell	" Enable spell-checking
set visualbell	" Use visual bell (no beeping)
set scrolloff=999	"macht dass der Curser immer in der Mitte ist.
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

""Nerdtree
map <C-n> :NERDTreeToggle<CR>

""Folding code
set foldmethod=indent
" Keep all folds open when a file is opened
"augroup OpenAllFoldsOnFileOpen
 "   autocmd!
  "  autocmd BufRead * normal zR
"augroup END
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

execute pathogen#infect()
call pathogen#helptags()

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

map <F7> gg=G<C-o><C-o>
:highlight LineNr ctermfg=grey
