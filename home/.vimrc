" .vimrc by othree ( othree AT gmail DOT com )

" Vundle
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Colors
Bundle 'tir_black'
Bundle 'jellybeans.vim'
Bundle 'altercation/vim-colors-solarized'

" Improve
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'VisIncr'
Bundle 'Align'
Bundle 'othree/eregex.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mbbill/undotree'
Bundle 'spiiph/vim-space'
Bundle 'SyntaxComplete'
Bundle 'AndrewRadev/switch.vim'
Bundle 'Raimondi/delimitMate'

Bundle 'L9'
Bundle 'othree/vim-autocomplpop'
Bundle 'vim-scripts/matchit.zip'
" Bundle 'ervandew/supertab'

Bundle 'kana/vim-operator-user'
Bundle 'kana/vim-operator-replace'

Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'MarcWeber/vim-addon-local-vimrc'
Bundle 'tomtom/tlib_vim.git'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" Bundle 'othree/vim-snipmate'
Bundle 'airblade/vim-gitgutter'

Bundle 'Lokaltog/vim-easymotion'

" 
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

" Tim Pope
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-characterize'

" Filetype
Bundle 'SyntaxRange'
Bundle 'tpope/vim-haml'
Bundle 'mattn/zencoding-vim'
Bundle 'othree/html5.vim'
Bundle 'othree/xml.vim'

" JavaScript
" Bundle 'othree/javascript-syntax.vim'
" Bundle 'jelera/vim-javascript-syntax'
Bundle 'othree/vim-javascript-syntax'
Bundle 'JSON.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'jiangmiao/simple-javascript-indenter'
Bundle 'teramako/jscomplete-vim'
" Bundle 'othree/jslint.vim'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'
" Bundle 'othree/coffee-check.vim'
Bundle 'othree/fecompressor.vim'

" LiveScript
Bundle 'gkz/vim-ls'

Bundle 'nginx.vim'

Bundle 'hail2u/vim-css3-syntax'
Bundle 'ap/vim-css-color'

Bundle 'juvenn/mustache.vim'
Bundle 'nono/vim-handlebars'

Bundle 'plasticboy/vim-markdown'

" ctags
Bundle 'majutsushi/tagbar'

" supertab
Bundle 'ervandew/supertab'

" multiple cursor
Bundle 'terryma/vim-multiple-cursors'

" For Fun
Bundle 'mattn/hahhah-vim'
Bundle 'tyru/banban.vim'

filetype plugin indent on 

" Basic Settings: {{{
syntax on
filetype on
filetype plugin on
filetype indent on
" colors tir_black
" colors jellybeans
colors Tomorrow-Night-Bright
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
" colorscheme solarized
language message zh_TW.UTF-8

set nocompatible
set display+=lastline
set wrap
set showtabline=2 " always show tab line
set ruler
set nu
set nuw=5
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set hlsearch
set foldmethod=marker
set backspace=indent,eol,start whichwrap+=<,>,[,]
set hidden
set nobomb
set hlsearch

let mapleader = ","

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,big5
set ambiwidth=double
set t_Co=256

" Status Line
set laststatus=2
set statusline=%f\ %y%r%1*%m%*\ %{g:HahHah()}%=%<\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ %4c\ %4l\ [%P]
" set statusline=%=%{g:HahHah()}

" Special File Types
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile *.tpl set ft=html
au BufRead,BufNewFile *.xsl set ft=html
au BufRead,BufNewFile *.json set syntax=json 
au BufRead,BufNewFile *.n3  set ft=n3
au BufRead,BufNewFile /usr/local/etc/nginx/* set ft=nginx 
au BufRead,BufNewFile /etc/nginx/* set ft=nginx 
au BufRead,BufNewFile *.hbs set ft=handlebars
au BufRead,BufNewFile *.rb set sw=2 sts=2 st=2
au BufRead,BufNewFile *.rake set sw=2 sts=2 st=2
au BufRead,BufNewFile *.ls set sw=2 sts=2 st=2
au BufNewFile,BufReadPost *.ls setl foldmethod=indent nofoldenable

" highlight line & column
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" Color Tweak for highlight
" highlight CursorLine    ctermbg=89
" highlight Comment       ctermfg=246

" }}}

" FileType: {{{
"" omnifunc setting
setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=ccomplete#Complete
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

autocmd FileType coffee set ts=2 sw=2 sts=2
autocmd FileType vim set ts=2 sw=2 sts=2

autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-]>") |
    \ endif

let g:omni_syntax_group_include_javascript = 'javascript\w\+,jquery\w\+,underscore\w\+,prelude\w\+,requirejs\w\+'

" }}}

" Screen Fix: {{{
if &term =~ '^screen' 
    set t_k1=[11~
    set t_k2=[12~
    set t_k3=[13~
    set t_k4=[14~
endif
" }}}

" QuickFix: {{{
" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nnoremap <leader>q :QFix<CR>

" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" http://vim.wikia.com/wiki/Automatically_quit_Vim_if_quickfix_window_is_the_last
au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction
" }}}

" Key Mapping: {{{

" http://vim.wikia.com/wiki/Map_semicolon_to_colon
" map ; :

"" function keys
nmap <F2>  :set nonumber!<CR>
nmap <F3>  :set nopaste!<CR>
nmap <F4>  :set spell!<CR>
" Leave F5 for ctrlp
nmap <F6>  :set wrap!<CR>
nmap <F7>  :QFix<CR>
nmap <F8>  :UndotreeToggle<CR>
nmap <F12> :tab ball<CR>
" F12 > JSLint

"" tab to indent
nmap <tab> V>
vmap <tab> >gv
nmap <s-tab> V<
vmap <s-tab> <gv

"" HOME END
nmap <C-Home> gg
nmap <C-End> G<End>
imap <C-Home> <Esc>ggi
imap <C-End> <Esc>G<End>i

"" up/down base on screen
"noremap  <C-J>       gj
"noremap  <C-K>       gk
"noremap  <Down>      gj
"noremap  <Up>        gk
"inoremap <Down> <C-O>gj
"inoremap <Up>   <C-O>gk

"" Fix up/down in popup
" inoremap <silent><expr><Up> pumvisible() ? "<Up>" : "<C-O>gk"
" inoremap <silent><expr><Down> pumvisible() ? "<Down>" : "<C-O>gj"
" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"" tab control
"" http://c9s.blogspot.com/2007/08/vim-my-key-mapping-for-tabs.html
nmap    <leader>tn    :tabnew<cr>
nmap    <leader>te    :tabedit
nmap    <leader>tx    :tabedit .<cr>
nmap    <leader>th    :tab help<cr>

" nmap    <C-t>     :tabnew<cr>
" nmap    <C-w>     :tabc<cr>

nmap    <C-left>  :tabp<cr>
nmap    <C-right> :tabn<cr>

imap    <C-j>  <ESC>:tabn<CR>
nmap    <C-j>  :tabn<CR>
imap    <C-k>  <ESC>:tabp<CR>
nmap    <C-k>  :tabp<CR>

cmap w!! %!sudo tee > /dev/null %

"" keypad
"" http://vim.wikia.com/wiki/PuTTY_numeric_keypad_mappings
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OQ /
imap <Esc>OR *
imap <Esc>Ol +
imap <Esc>OS -

" Replace Operator
nmap <Leader>r <Plug>(operator-replace)
xmap <Leader>r <Plug>(operator-replace)

" ctags
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

let NERDMapleader='<Leader>c'

" switch
nnoremap - :Switch<cr>
"}}}

" Indent: {{{
let g:html_indent_inctags = "html,body,head,tbody,a"
let g:event_handler_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:SimpleJsIndenter_BriefMode = 1
" }}}

" SyntaxRange {{{

autocmd FileType html call SyntaxRange#Include('/<script[^>]*>/', '</script>', 'javascript', 'htmlTagName')
autocmd FileType html call SyntaxRange#Include('/<style[^>]*>/', '</style>', 'css', 'htmlTagName')

" }}}

" Zencoding: {{{
let g:user_zen_settings = {
    \  'php' : {
    \    'extends' : 'html',
    \    'filters' : 'c',
    \  },
    \  'xml' : {
    \    'extends' : 'html',
    \  },
    \  'html' : {
    \    'extends' : 'html',
    \  },
    \}
" }}}

" YankStack: {{{
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
" }}}

" Syntastic: {{{
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_javascript_jslint_conf = "--nomen --plusplus --forin --regexp"
" }}}

" Autocomplpop: {{{
"" acp options
let g:acp_enableAtStartup = 1
" let g:acp_mappingDriven = 1
let g:acp_completeOption = '.,w,b,u,t,i,k'
" let g:acp_behaviorSnipmateLength = 0

let g:acp_behaviorUserDefinedMeets = 'acp#meetsForKeyword'
let g:acp_behaviorUserDefinedFunction = 'syntaxcomplete#Complete'
" }}}

" NERDCommenter: {{{
let NERDSpaceDelims = 1
" }}}

" Popup Highlight: {{{
" highlight PMenu      cterm=bold ctermbg=Blue ctermfg=Gray
" highlight PMenuSel   cterm=bold ctermbg=Red ctermfg=White
" highlight PMenuSbar  cterm=bold ctermbg=darkgray
" highlight PMenuThumb cterm=bold ctermbg=White
" }}}

" SpeelBad Highlight: {{{
highlight SpellBad   ctermbg=124
" }}}

" HTML: {{{
"" HTML Tag Escape:
""  http://vim.wikia.com/wiki/Escape_and_unescape_HTML_entities
function HtmlEscape()
    silent s/&/\&amp;/eg
    silent s/</\&lt;/eg
    silent s/>/\&gt;/eg
    silent s/"/\&quot;/eg
endfunction

function HtmlUnEscape()
    silent s/&lt;/</eg
    silent s/&gt;/>/eg
    silent s/&amp;/\&/eg
    silent s/&quot;/"/eg
endfunction

function HtmlReIndent()
    silent %s/\(<\/\w\+\)>\s\?</\1></eg
    normal gg=G
endfunction
"map <silent> <c-h> :call HtmlEscape()<CR>
"map <silent> <c-u> :call HtmlUnEscape()<CR>

"" HTML omni
let b:html_omni_flavor = 'html5'
" }}}

" NERDTree: {{{
let NERDTreeShowHidden = 1
" }}}

" FuzzyFinder: {{{
let g:fuf_modesDisable = []
" }}}

" CoffeeTags: {{{
if executable('coffeetags')
    let g:tagbar_type_coffee = {
            \ 'ctagsbin' : 'coffeetags',
            \ 'ctagsargs' : '',
            \ 'kinds' : [
            \ 'f:functions',
            \ 'o:object',
            \ ],
            \ 'sro' : ".",
            \ 'kind2scope' : {
            \ 'f' : 'object',
            \ 'o' : 'object',
            \ }
            \ }
endif
" }}}

" syntastic: {{{
let g:syntastic_coffee_coffeelint_args="--csv -f ~/coffeelint-config.json"
" }}}

" ctrlp: {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_show_hidden = 0
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" }}}

" jscomplete-vim: {{{
let g:jscomplete_use = ['dom']
" }}}

" Command Mapping: {{{
com! -bang W :w
com! -bang Wq :wq
com! -bang Wqa :wqa
com! -bang WQ :wq
com! -bang WQa :wqa
com! -bang WQA :wqa
com! -bang Q :q
com! -bang Qa :qa
" }}}

" Macros: {{{
runtime macros/matchit.vim
" }}}

" Switch: {{{
let g:switch_custom_definitions =
    \ [
    \   ['and', 'or'],
    \   ['is', 'isnt'],
    \   ['w', 'h'],
    \   ['width', 'height'],
    \   {
    \     '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
    \     '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
    \     '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
    \     '\<\(\u\+\)\(_\u\+\)\+\>': "\\=tolower(substitute(submatch(0), '_', '-', 'g'))",
    \     '\<\(\l\+\)\(-\l\+\)\+\>': "\\=substitute(submatch(0), '-\\(\\l\\)', '\\u\\1', 'g')",
    \   }
    \ ]
" }}}

" After Loading All Plugin: {{{
function AfterStart ()

" plugin commands
"" Align
if exists(":Align")
    com! -bang -range -nargs=* A <line1>,<line2>call Align#Align(<bang>0,<q-args>)
endif

"" eregex
if exists(":M")
    nnoremap <leader>/ :call eregex#toggle()<CR>
endif

if exists(":NERDTreeToggle")
    map <F12> :NERDTreeToggle<CR>
endif

"" FuzzyFinder
if exists(":FufFile")
    nnoremap <leader>ff  :FufFile<CR>
    nnoremap <leader>fb  :FufBuffer<CR>
    nnoremap <leader>fr  :FufMruFile<CR>
endif

"" speeddating.vim
if exists(":SpeedDatingFormat")
    SpeedDatingFormat %H:%M
    SpeedDatingFormat %m/%d
    SpeedDatingFormat %Y/%m/%d%[ T_-]%H:%M:%S%?[Z]
endif

" Fix for vim-snipmate
nmap <tab> V>
vmap <tab> >gv

" yankstack
nmap Y y$

endfunction
autocmd VimEnter * :call AfterStart()
" }}}

map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

