" Enable vundle::::
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
" Stuff for handling markdowns
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Opening ranger in vim
Plugin 'francoiscabrol/ranger.vim'
Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
Plugin 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"Show diff between file and swap file option
Plugin 'chrisbra/Recover.vim'

"Shows tag differences
Plugin 'majutsushi/tagbar'
"nmap <F6> :TagbarToggle<CR>

" Autocomplete in python
"Plugin 'davidhalter/jedi-vim'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"set t_Co=256
" Dracula color theme
Plugin 'dracula/vim'

Plugin 'xuhdev/vim-latex-live-preview'
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'pdflatex'
map <leader>l : LLPStartPreview<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

let g:ranger_map_keys = 0
map <leader>r : RangerNewTab<CR>

"nerd tree (tree on side)
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

set rtp+=~/.fzf
Plugin 'junegunn/fzf' "File manager
Plugin 'junegunn/fzf.vim' "File manager

Plugin 'w0rp/ale'
let g:ale_enabled=1
let g:ale_linters = {'python': ['pylint']}
"let g:ale_lint_on_text_changed = 'never'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
" Set , as new leader
let mapleader = ","

hi clear SpellBad
hi SpellBad cterm=underline
hi SpellBad ctermfg=red

execute pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=4       " number of visual spaces per TAB
set shiftwidth=4
set expandtab       " tabs are spaces
set softtabstop=4   " number of spaces in tab when editingset softtabstop=4   " number of spaces in tab when editing
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
filetype plugin indent on
"set statusline+=%F    "Show file name
set spell spelllang=en_us "Set spell check to english
set autoread

" Turn on relative numbers
set relativenumber
set rnu

" move vertically by visual line
nnoremap j gj
nnoremap k gk


" Toggle auto compiling of md
" OpenLog Opens or Closes the Log (at bottom)
" F8Helper clears the log by going down 1 window and saving/whiping
let g:log_open = 0
map <leader>a :!setsid renderMD % &<CR>
map <F7> :w<CR>:!clear;python %<CR>
map <F9> :let g:file_name=@%<CR>:call F8Helper()<CR>:set splitbelow<CR>:new .log<CR>:!>.log<CR>:e<CR>:execute 'read !python ' . g:file_name<CR>:w<CR>:resize 10<CR>:call MyFeedKeysEditor()<CR><CR>
"map <F8> :call F8Helper()<CR>:set splitbelow<CR>:new .log<CR>:!>.log<CR>:e<CR>:read !python master.py<CR>:w<CR>:resize 10<CR>:let g:log_open=1<CR>:call MyFeedKeysEditor()<CR><CR>
map <F6> :call OpenLog()<CR><CR>:call MyFeedKeysEditor()<CR><CR>
map <F2> :w<CR>:!clear;compileLaTeX master.tex<CR>
noremap <leader>y "+y
nnoremap <leader>f :read !getImage<CR>
" Binding to open vim
nnoremap <leader>v :tabnew $MYVIMRC<CR>

" Automatically source vimrc when changed
autocmd BufWritePost .vimrc source $MYVIMRC
" Bind key to open .bib
nnoremap <leader>b :tabnew *.bib <CR>
nnoremap <C-l> :Lines<CR>
nnoremap <leader>u :tabnew<CR>:UltiSnipsEdit  <CR>
"Create binding to find and open file in new tab

nnoremap <C-t> :tabnew<CR>:Files<CR>
nnoremap <S-t> :vsp<CR>:Files<CR>
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>


" Airline stuff
" air-line
set encoding=utf-8
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.dirty=⚡

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

set noea
" Tab switiching in vim
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-j> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <S-k> :tabnext<CR>
"Get rid of ugly bars
set fillchars+=vert:\
"hi VertSplit guibg=bg guifg=bg


if exists('*OpenLog')
    finish
endif
function! OpenLog()
    :call CheckBottom()
    if g:log_open == 0
        :set splitbelow
        :new .log
        :resize 10
        :echo "Opening Log"
    else
        :call MyFeedKeys()
        :wq
        :echo "Closing Log"
    endif
endfunction

if exists('*F8Helper')
    finish
endif

function! F8Helper()
    :call CheckBottom()
    if g:log_open == 0
        :!> .log
    else
        :call MyFeedKeys()
        :wq
        :!> .log
    endif
endfunction


function! CheckBottom()
    "Move Up
    :wincmd k
    "Is current window bottom window?
    "Yes if 1 window
    "No if 2 window
    let g:log_open=winnr() != winnr('100j')
endfunction


"Checks to see if a log is open by seeing if window can move to bottom and be
"only one
function! CheckBottom2()
    "Get window number of top
    :let winnum=winnr('100k')
    "Get window layout for top
    :let toplayout=winlayout(winnum)
    "If it has "col" in it then log is open, otherwise it isnt.
    :let g:log_open=0
	:for item in toplayout
    "1 is a string type
    :   if type(item) != 1
    :       continue
    :   endif
	:   if item =~ "col"
    :       let g:log_open=1
    :       break
    :   endif
	:endfor
endfunction


function! MyFeedKeys()
    :wincmd j
endfunction

function! MyFeedKeysEditor()
    :wincmd k
endfunction


