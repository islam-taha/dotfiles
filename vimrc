
"                      VUNDLE
" =============================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'vim-ruby/vim-ruby'
Plugin 'dag/vim-fish'
Plugin 'mattn/emmet-vim'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'justinmk/vim-syntax-extra'

Plugin 'rbgrouleff/bclose.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'cohama/lexima.vim'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'hlissner/vim-multiedit'
Plugin 'airblade/vim-gitgutter'
Plugin 'islam-taha/vim-react-es6-snippets'

Plugin 'janko-m/vim-test'

Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'digitaltoad/vim-pug'


Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'machakann/vim-textobj-delimited'
Plugin 'rizzatti/dash.vim'
Plugin 'gorkunov/smartpairs.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'SirVer/ultisnips'

" Test Run
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kana/vim-textobj-user'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-vinegar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tpope/vim-obsession'
Plugin 'othree/html5.vim'
Plugin 'alvan/vim-closetag'
Plugin 'jceb/vim-orgmode'
Plugin 'flowtype/vim-flow'
" Plugin 'andreypopp/vim-flow-outline'


" Colour Themes
Plugin 'joshdick/onedark.vim'
Plugin 'dracula/vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'GertjanReynaert/cobalt2-vim-theme'
Plugin 'trevordmiller/nova-vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'islam-taha/vim-code-dark'
Plugin 'fneu/breezy'
Plugin 'whatyouhide/vim-gotham'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'lifepillar/vim-wwdc16-theme'

call vundle#end()
filetype plugin indent on
syntax on

runtime macros/matchit.vim

" =============================================================
"                 GENERAL SETTINGS
" =============================================================

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
set relativenumber
set number
set wrap
set linebreak
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
set shell=bash
set clipboard=unnamed
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
set listchars=eol:¬,tab:>.,trail:~,extends:>,precedes:<,space:.
set path+=**
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

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Dash search
" nmap <silent> <leader>d <Plug>DashSearch

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" jsBeautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" " for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" " for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" " for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" " for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()

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
" nnoremap <leader>w :CtrlP app/assets/javascripts<cr>
" qnqremap <leader>gc :CtrlP app/controllers<cr>
" nnoremap <leader>gv :CtrlP app/views<cr>
" nnoremap <leader>gm :CtrlP app/models<cr>
" nnoremap <leader>gs :CtrlP app/services<cr>
" nnoremap <leader>gr :CtrlP spec<cr>
" nnoremap <leader>gt :CtrlP ~/Dropbox/gollum<cr>
" nnoremap <leader>gp :CtrlP <C-R>=expand("%:p:h") . "/"<cr><cr>

" Command-T
" nnoremap <leader>f :CommandT<cr>
" nnoremap <leader>. :CommandTBuffer<cr>
" nnoremap <leader>p :CommandTFlush<cr>

nnoremap <leader>z :Gstatus<CR><C-w>20+

nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>

" Rails plugin navigation
" nnoremap <leader>gc :Econtroller
" nnoremap <leader>gm :Emodel
" nnoremap <leader>gv :Eview
" nnoremap <leader>gr :Espec
" nnoremap <leader>gj :Ejavascript
" nnoremap <leader>gs :Eservice
" nnoremap <leader>gi :Einitializer

" inc search for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" multiedit
" Insert a disposable marker after the cursor
nmap <leader>ma :MultieditAddMark a<CR>

" Insert a disposable marker before the cursor
nmap <leader>mi :MultieditAddMark i<CR>

" Make a new line and insert a marker
nmap <leader>mo o<Esc>:MultieditAddMark i<CR>
nmap <leader>mO O<Esc>:MultieditAddMark i<CR>

" Insert a marker at the end/start of a line
nmap <leader>mA $:MultieditAddMark a<CR>
nmap <leader>mI ^:MultieditAddMark i<CR>

" Make the current selection/word an edit region
vmap <leader>m :MultieditAddRegion<CR>
nmap <leader>mm viw:MultieditAddRegion<CR>

" Restore the regions from a previous edit session
nmap <leader>mu :MultieditRestore<CR>

" Move cursor between regions n times
map ]m :MultieditHop 1<CR>
map [m :MultieditHop -1<CR>

" Start editing!
nmap <leader>M :Multiedit<CR>

" Clear the word and start editing
nmap <leader>C :Multiedit!<CR>

" Unset the region under the cursor
nmap <silent> <leader>md :MultieditClear<CR>

" Unset all regions
nmap <silent> <leader>mr :MultieditReset<CR>

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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { 'level': 'warnings' }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '/usr/local/var/rbenv/shims/rubocop'

" vim-sessions
let g:session_default_overwrite = 1
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 0

" html5
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" jsx pretty
let g:vim_jsx_pretty_colorful_config = 1

" NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1

" Easymotion
nmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-bd-t)
vmap s <Plug>(easymotion-bd-t)

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
" let g:airline_theme='papercolor'

" Markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

" CtrlP
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*

" JSX
let g:jsx_ext_required = 0
let g:javascript_enable_domhtmlcss = 1
let g:used_javascript_libs = 'underscore,react,chai'

" YouCompleteMe
" remove markdown files from black list
let g:ycm_filetype_blacklist={'notes': 1, 'unite': 1, 'tagbar': 1, 'pandoc': 1, 'qf': 1, 'vimwiki': 1, 'text': 1, 'infolog': 1, 'mail': 1}
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" =============================================================
"                      APPEARENCE
" =============================================================

"set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Making cursor a bar in insert mode
" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"
"
set noeb vb t_vb=


colorscheme codedark
set background=dark

if has("gui_running")
  set guifont=menlo\ for\ powerline:h12
  set linespace=2
  set guioptions-=r
  set guioptions-=L
  set lines=53 columns=216
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

" set langmap=йцукенгшщзхъфывапролджэячсмитьбю;qwfpgjluy\\;[]arstdhneio'zxcvbkm\\,.

" abbrevs for Star Wars
" iabbrev dgre &#246;
" iabbrev dred &#243;
" iabbrev dpur &#245;
" iabbrev dyel &#244;
" iabbrev dfor &#247;
" iabbrev dbla &#241;
" iabbrev dblu &#242;
"
" iabbrev dlig &#248;
" iabbrev ddar &#249;
" iabbrev ddes &#250;
" iabbrev dadv &#251;
" iabbrev dfai &#253;
" iabbrev dsuc &#255;
" iabbrev dthr &#252;
" iabbrev dtri &#254;
"
" let @y=':%s/“/"/g'
" let @u=':%s/”/"/g'
" let @l=':%s/’/''/g'
" let @j=':%s/—/-/g'

let @n='y:newi```pkdd:set ft=markdowngg[ Ajs'
let @e='ggVG: w! >> ~/Dropbox/Content/notes.md:bd!'
nnoremap <leader>en :new +set\ ft=markdown<cr>o

