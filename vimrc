"
"                      VUNDLE
" =============================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'shime/vim-livedown'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'plasticboy/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'sheerun/vim-polyglot'
Plugin 'dracula/vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'tomtom/tcomment_vim'
Plugin 'islam-taha/vim-code-dark'
Plugin 'islam-taha/vim-react-es6-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

if &t_Co >= 256
  colorscheme dracula
endif

if has("gui_running")
    colorscheme codedark
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

runtime macros/matchit.vim

" =============================================================
"                 GENERAL SETTINGS
" =============================================================
set ttyfast
set lazyredraw
set backspace=indent,eol,start
set history=1000
set ruler
set showcmd
set autoindent
set showmatch
set nowrap
set autoread
set autowrite
set backupdir=~/.vimtmp
set directory=~/.tmp
set viminfo+=!
set guioptions-=T
set laststatus=2
set scrolloff=3
set sidescrolloff=4
set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" set relativenumber
set number
set wrap
set linebreak
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
set shell=bash
set clipboard+=unnamed
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999
set noswapfile
set wildmenu
set nostartofline
" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1
set list
set listchars=eol:¬,tab:>.,trail:~,extends:>,precedes:<
set shortmess+=at
" set cmdheight=2
set path+=**
set synmaxcol=200
set nocursorline
set paste
set nocursorcolumn
syntax sync minlines=256
" =============================================================
"                    AUTOCOMMANDS
" =============================================================

if has("autocmd")
  augroup vimrcEx
    au!

    autocmd BufRead *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    autocmd BufRead,BufNewFile *.asc setfiletype asciidoc

    au BufNewFile,BufReadPost *.md set filetype=markdown
  augroup END
endif

" =============================================================
"                      MAPPINGS
" =============================================================

let mapleader = ","

inoremap <c-t> <ESC>
vnoremap <c-t> <ESC>

" insert mode
imap <c-e> <esc>A

" Quick open most used files
nnoremap <leader>em :!open -a 'Marked 2.app' '%:p'<cr>
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>es :split<cr>:UltiSnipsEdit<cr>
nnoremap <leader>eN :split<cr>:e ~/Dropbox/Content/notes.md<cr>

" augroup highlight
"   " Remove ALL autocommands for the current group.
"   autocmd!
"
"   " Leave the return key alone when in quickfix windows, since it's used
"   " to run commands there.
"   autocmd BufEnter * :if &buftype is# "quickfix" | :unmap <cr>| else | :call MapCR()| endif
"
"   " Leave the return key alone when in command line windows, since it's used
"   " to run commands there.
"   autocmd CmdwinEnter * :unmap <cr>
"   autocmd CmdwinLeave * :call MapCR()
"
"   " Highlight characters longer than 100 characters
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
"   autocmd BufEnter * match OverLength /\%>100v.\+/
" augroup END

map gn :bn<cr>
map gp :bp<cr>
map <s-w> :BD<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" create/open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

nnoremap <silent> <space> :nohl<Bar>:echo<CR>
nnoremap <leader>w mzyyp`zj
nnoremap <leader>v :set invpaste paste?<CR>
nnoremap <leader>V V`]
nmap k gk
nmap j gj
nnoremap H ^
nnoremap E $
nnoremap gw <c-w>w

noremap <Leader>d :Bclose<CR>
noremap <Leader>D :bufdo bd<CR>

cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>

" CtrlP plugin
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>. :CtrlPBuffer<cr>
nnoremap <leader>p :CtrlPClearCache<cr>
nnoremap <leader>cr :CtrlPCurWD<cr>

nnoremap <leader>z :Gstatus<CR><C-w>20+

nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>

" inc search for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" saves cursor after yanking in visual mode
vnoremap y myy`y
vnoremap Y myY`y

" vim test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let g:test#javascript#mocha#executable = 'NODE_ENV=test mocha'
let g:test#rspec#executable = 'bin/rspec'
let g:test#javascript#mocha#options = {
  \ 'nearest': '--require babel-register',
  \ 'file':    '--require babel-register',
  \ 'suite':   'NODE_ENV=test',
\}
" =============================================================
"                 PLUGINS CONFIGURATION
" =============================================================

" autocmd BufWinLeave .* mkview
" autocmd BufWinEnter .* silent loadview

" vim-sessions
let g:session_default_overwrite = 1
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 0

" html5
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx, *.erb"

" jsx pretty
let g:vim_jsx_pretty_colorful_config = 1

" NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=1

" Easymotion
nmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-bd-t)
vmap s <Plug>(easymotion-bd-t)

" Airline

if has('gui_running')
  let g:airline_theme = 'codedark'
else
  let g:airline_theme='dracula'
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2

let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" Multiple cursors setup
let g:multi_cursor_use_default_mapping=1
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'

" Markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

" CtrlP
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*

" JSX
let g:jsx_ext_required = 0
let g:javascript_enable_domhtmlcss = 1
let g:used_javascript_libs = 'underscore,react,chai'

" match tags always
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'eruby' : 1,
    \ 'javascript.jsx' : 1,
    \}

" YouCompleteMe
" remove markdown files from black list
let g:ycm_filetype_blacklist={'notes': 1, 'unite': 1, 'tagbar': 1, 'pandoc': 1, 'qf': 1, 'vimwiki': 1, 'text': 1, 'infolog': 1, 'mail': 1}
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'ruby': ['rubocop'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1
" =============================================================
"                      APPEARENCE
" =============================================================

"set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set noeb vb t_vb=

set background=dark

if has("gui_running")
  set guifont=SourceCodePro+Powerline+Awesome\ Regular:h12
  set linespace=2
  set guioptions-=r
  set guioptions-=L
endif

" =============================================================
"                      PROJECTIONS
" =============================================================

let g:rails_projections = {
      \ "app/services/*.rb": {
      \   "command": "service",
      \   "template":
      \     ["class %S", "end"],
      \   "test": [
      \     "test/unit/%s_uploader_test.rb",
      \     "spec/services/%s_spec.rb"
      \   ],
      \   "keywords": "process version"
      \ }}

" =============================================================
"                      CUSTOM FUNCTIONS
" =============================================================

" Create folders on file save
" ===========================

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

" Remove whitespaces on save saving cursor position
" =================================================

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

let @n='y:newi```pkdd:set ft=markdowngg[ Ajs'
let @e='ggVG: w! >> ~/Dropbox/Content/notes.md:bd!'
nnoremap <leader>en :new +set\ ft=markdown<cr>o

