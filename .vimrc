""" Indierambler Standard .vimrc or init.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start Vim-Plug
call plug#begin()

" Theme Plugins
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sickill/vim-monokai'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim'

" Aesthetics
Plug 'ryanoasis/vim-devicons'   " for tree icons for filetypes (not working?)
Plug 'junegunn/rainbow_parentheses.vim' " color parentheses to match pairs

" GUI Enhancement
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'   " fancy start screen for vim
Plug 'mhinz/vim-signify'    " tracks file modification in a sign column

" Coding Enhancement
Plug 'SirVer/ultisnips' " automatic snippets
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'  " commenting support
Plug 'neoclide/coc.nvim', {'branch': 'release'} " text editing support
"Plug 'jupyter-vim/jupyter-vim'  " allow jupyter integration to vim
Plug 'bfredl/nvim-ipy'  " allow jupyter integration to vim

" End Vim-Plug
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Main Configuration
set showmatch               " show matching
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set splitright              " open new split panes to the right
set splitbelow              " open new split panes below
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugin Configuration
let NERDTreeShowHidden=1    " default to showing hidden files in the tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme Configuration
if (has('termguicolors'))
    set termguicolors
endif
syntax enable

" basic vim theme
"colorscheme evening

" dracula theme
"colorscheme dracula

" tokyo night theme
"let g:tokyonight_style = "storm"    " vals: storm, night, or day
"let g:tokyonight_italic_functions = 1
"let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
"let g:tokyonight_transparent = 1
" Change the "hint" color to the "orange" color, and make the "error" color bright red
"let g:tokyonight_colors = {
"  \ 'hint': 'orange',
"  \ 'error': '#ff0000'
"\ }
"colorscheme tokyonight  " load the color scheme

" monokai theme - decent contrast but not much documentation
"let g:monokai_term_italic = 1
"let g:monokai_gui_italic = 1
"colorscheme monokai

" nightfox theme
lua << EOF
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  }
})
EOF
colorscheme terafox " vals: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Key Mappings
" inoremap: maps the key in insert mode
" nnoremap: maps the key in normal mode
" vnoremap: maps the key in visual mode
" <C> : represents Control key
" <A> : Alt key

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" open file in a text by placing text and gf
:nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Commands to Run on Startup
autocmd VimEnter * NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
