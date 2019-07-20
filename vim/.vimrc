" Enable vundle::::
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
" Stuff for handling markdowns
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Opening ranger in vim
Plug 'francoiscabrol/ranger.vim'
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-z>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"Show diff between file and swap file option
Plug 'chrisbra/Recover.vim'

"Yapf reformats python files so that way they dont look like trash if they
"come looing like trash
Plug 'google/yapf'

"Shows tag differences
Plug 'majutsushi/tagbar'
map <C-m> :TagbarToggle<CR>

" Autocomplete in python
"Plugin 'davidhalter/jedi-vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"set t_Co=256
" Dracula color theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'srcery-colors/srcery-vim'

" Julia plugin
Plug 'JuliaEditorSupport/julia-vim'

" The Big COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc-python', {'branch': 'release'}
"Plug 'neoclide/coc-tabnine', {'branch': 'release'}

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion,
" `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region,
" ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges,
" needs server support,
" like: coc-tsserver,
" coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction(
"'runCommand',
" 'editor.action.organizeImport',
")

" Add status line support,
" for integration with other plugin,
" checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Useful for testing
Plug 'janko/vim-test'

" Surrounds stuff
Plug 'tpope/vim-surround'

Plug 'xuhdev/vim-latex-live-preview'
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
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

set rtp+=~/.fzf
Plug 'junegunn/fzf' "File manager
Plug 'junegunn/fzf.vim' "File manager

Plug 'w0rp/ale'
let g:ale_enabled=1
let g:ale_linters = {'python': ['pylint']}
Plug 'timothycrosley/isort' " Used for sorting libraries
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['isort', 'ale#fixers#generic_python#BreakUpLongLines', 'yapf'],
            \}
let g:ale_fix_on_save = 1

"Allows for async running of files. Prob replacces what I did...
Plug 'skywind3000/asyncrun.vim'
nnoremap <F5> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun -raw python %"
    endif
endfunction
let g:asyncrun_open = 8
augroup vimrc
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END


"let g:ale_lint_on_text_changed = 'never'
call plug#end()
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
set autochdir           " CD to whats being worked on
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
map <F9> :let g:file_name=@%<CR>:call GetExtension()<CR>:call F8Helper()<CR>:set splitbelow<CR>:new .log<CR>:!>.log<CR>:e<CR>:call RunStuff()<CR>:w<CR>:resize 10<CR>:call MyFeedKeysEditor()<CR><CR>
"map <F8> :call F8Helper()<CR>:set splitbelow<CR>:new .log<CR>:!>.log<CR>:e<CR>:read !python master.py<CR>:w<CR>:resize 10<CR>:let g:log_open=1<CR>:call MyFeedKeysEditor()<CR><CR>
"map <F6> :call OpenLog()<CR><CR>:call MyFeedKeysEditor()<CR><CR>
"noremap <F6> :call asyncrun#quickfix_toggle(8)<cr>
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
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.',).'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
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
set fillchars=vert:\
"hi VertSplit guibg=NONE guifg=NONE


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
        :setl noea
        :call MyFeedKeys()
        :wq
        :echo "Closing Log"
        :setl ea
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

function! GetExtension()
    :let g:extension=expand('%:e')
endfunction

function! RunStuff()
    :if g:extension =~ 'sh'
    :   execute 'read !bash ' . g:file_name
    :   echo "Setting script"
    :elseif g:extension =~ 'py'
    :   execute 'read !python ' . g:file_name
    :   echo "Setting Python"
    :else
    :   echo "No Make Made For This File Type!"
    :endif
endfunction


"Sets makeprg automatically
"Will finish eventually
function! SetMakePrg()
    :let extension=expand('%:e')
    :if extension =~ 'sh'
    :   set makeprg=bash\ %
    :   echo "Setting script"
    :elseif extension =~ 'py'
    :   set makeprg=python\ %
    :   echo "Setting Python"
    :else
    :   echo "No Make Made For This File Type!"
    :endif
endfunction


function! CheckBottom()
    "Move Up
    :wincmd k
    "Is current window bottom window?
    "Yes if 1 window
    "No if 2 window
    let g:log_open=winnr() != winnr('100j')
endfunction


function! MyFeedKeys()
    :wincmd j
endfunction

function! MyFeedKeysEditor()
    :wincmd k
endfunction
