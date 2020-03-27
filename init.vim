 call plug#begin()
 try
   Plug 'scrooloose/nerdtree'
   Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
   Plug 'cocopon/iceberg.vim'
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Plug 'junegunn/fzf.vim'
   Plug 'ap/vim-buftabline'
   Plug 'tpope/vim-surround'
   Plug 'tpope/vim-commentary'
   Plug 'mxw/vim-jsx'
   Plug 'pangloss/vim-javascript'
   Plug 'w0rp/ale'
   Plug 'raimondi/delimitmate'
   Plug 'chrisbra/colorizer'
   Plug 'tpope/vim-fugitive'
   Plug 'jremmen/vim-ripgrep'
   Plug 'easymotion/vim-easymotion'
   Plug 'leafgarland/typescript-vim'
   Plug 'peitalin/vim-jsx-typescript'
   Plug 'reasonml-editor/vim-reason-plus'
   Plug 'itchyny/vim-qfedit'
   Plug 'autozimu/LanguageClient-neovim', {
     \ 'branch': 'next',
     \ 'do': 'bash install.sh',
      \ }
 catch
 endtry


call plug#end()

colorscheme iceberg
set nocompatible
set hidden
filetype plugin indent on
syntax enable


set nobackup
set nowritebackup
set shortmess+=c

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

set completeopt-=preview

set diffopt+=vertical

nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>


let g:rg_command = 'rg --vimgrep'
let g:rg_highlight = 1 "true if you want matches highlighted
let g:rg_derive_root = 1 "true if you want to find project root from cwd
let g:rg_format = '%f:%l:%m'

" UI
set vb t_vb=          " disbale visual bell
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 set termguicolors

set number            " show line numbers
set cursorline        " highlight current line
set showmode          " show the current mapleaderode
set scrolloff=5       " start scolling lines 5 from top or bottom
set signcolumn=yes

let mapleader=","

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

"Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <S-j> :bprev!<CR>
nnoremap <S-k> :bnext!<CR>

"nnoremap <C-N> :bnext<CR>
"nnoremap <C-P> :bprev<CR>

nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>j k:join<CR>

:set tabstop=2 shiftwidth=2 expandtab
:set listchars=tab:!·,trail:·

let NERDTreeShowBookmarks=1

set incsearch         " search as characters are entered
set hlsearch          " highligh search results
set smartcase         " smart casing search
set ignorecase

" Better up / down Movement
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

vnoremap B ^
vnoremap E $

nnoremap <silent><leader>w :wa!<CR>
nnoremap <leader>x :bd!<CR>
nnoremap <leader>xa :bd *<C-a><CR>

nnoremap <leader>z za
nnoremap z<leader> za

xmap s <Plug>VSurround

inoremap jk <Esc>
inoremap kj <Esc>

inoremap <leader>p <C-r>"

set nojoinspaces                      " J command doesn't add extra space

nnoremap <C-p> :GFiles<CR>


" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" snippets
nnoremap <leader>anp ddOawait new Promise(resolve => setTimeout(resolve, 9999999))<ESC>

" let g:tsuquyomi_disable_quickfix = 1
let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

set path=.,src,node_nodules
set suffixesadd=.js,.jsx

set shortmess+=c
set cmdheight=2

let $FZF_DEFAULT_OPTS='--layout=reverse'
nnoremap <leader>b :Buffers<CR>

let g:buftabline_show = 2
let g:NERDTreeWinSize=65
let g:NERDTreeWinPos="left"
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeMinimalUI=1

" == junegunn/fzf ==
nnoremap <C-P> :FZF<CR>
inoremap <C-P> <ESC>:FZF<CR>i

"overwriting buftabline colors
hi link BufTabLineCurrent CursorLineNr
hi link BufTabLineActive LineNr
hi link BufTabLineHidden LineNr
hi link BufTabLineFill LineNr

let g:delimitMate_expand_cr = 2        " Turns on/off the expansion of <CR>.
let g:delimitMate_expand_space = 1     " Turns on/off the expansion of <Space>.
let g:delimitMate_jump_expansion = 0   " Turns on/off jumping over expansions.
let delimitMate_smart_quotes = 1     " Turns on/off the "smart quotes" feature.

" linting config
let g:jsx_ext_required = 0


let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['prettier'],
\}


" tslint is deprecated!
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_completion_enabled = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0

let g:ale_javascript_prettier_options = '--print-width 80 --no-semi --single-quote --trailing-comma none'
let g:ale_typescript_prettier_options = '--print-width 80 --single-quote'


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gt <Plug>(coc-references)

nnoremap <silent><leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

command! -nargs=0 Format :call CocAction('format')
nmap <Leader>gp :Format<cr>

map  f <Plug>(easymotion-bd-f)
nnoremap gr :Rg <cword><cr>
nnoremap <leader>fj :%!python -m json.tool

nnoremap glog yiwoconsole.log('<c-r>"', <C-r>")<Esc>
nnoremap glos yiwoconsole.log(JSON.stringify(<C-r>", null, 2))<Esc>

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
