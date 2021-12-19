 call plug#begin()
 try
   Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
   Plug 'cocopon/iceberg.vim'
   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
   Plug 'junegunn/fzf.vim'
   Plug 'ap/vim-buftabline'
   Plug 'tpope/vim-surround'
   Plug 'tpope/vim-commentary'
   Plug 'pangloss/vim-javascript'
   Plug 'leafgarland/typescript-vim'
   Plug 'MaxMEllon/vim-jsx-pretty' 
   Plug 'raimondi/delimitmate'
   Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
   Plug 'easymotion/vim-easymotion'
   Plug 'itchyny/vim-qfedit'
 catch
 endtry


call plug#end()

colorscheme iceberg
set nocompatible
set hidden
filetype plugin indent on
syntax enable


let g:coc_global_extensions = ['coc-explorer', 'coc-json', 'coc-prettier', 'coc-eslint', 'coc-tsserver', 'coc-fish', 'coc-css']

set nobackup
set nowritebackup
set shortmess+=c

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

set completeopt-=preview

set diffopt+=vertical

" let g:rg_command = 'rg --vimgrep'
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

"overwriting colors
hi link BufTabLineCurrent CursorLineNr
hi link BufTabLineActive LineNr
hi link BufTabLineHidden LineNr
hi link BufTabLineFill LineKr
hi CocErrorSign guifg=#e27878 guibg=#1e2132
hi CocInfoSign guifg=#e2a478 guibg=#1e2132
hi CocWarningSign guifg=#e2a478 guibg=#1e2132
hi CocInfoSign guifg=#e2a478 guibg=#1e2132
hi link CocErrorHighlight SpellBad
hi! clear CocUnderline

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

" nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>n :CocCommand explorer<CR>
nmap <C-\> :CocCommand explorer<CR>
nmap <Leader>j k:join<CR>

:set tabstop=2 shiftwidth=2 expandtab
:set listchars=tab:!·,trail:·

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

nnoremap <leader>w :wa!<CR>
nnoremap <leader>x :bd!<CR>
nnoremap <leader>xx :bd!<CR>
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


let g:delimitMate_expand_cr = 2        " Turns on/off the expansion of <CR>.
let g:delimitMate_expand_space = 1     " Turns on/off the expansion of <Space>.
let g:delimitMate_jump_expansion = 0   " Turns on/off jumping over expansions.
let delimitMate_smart_quotes = 1     " Turns on/off the "smart quotes" feature.

" linting config
let g:jsx_ext_required = 0


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
nmap <leader>do <Plug>(coc-codeaction-cursor)

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

command! -nargs=0 Format :CocCommand prettier.formatFile
nmap <Leader>gp :Format<cr>
nmap <Leader>gc :coca<tab><cr>

map f <Plug>(easymotion-bd-f)
nnoremap gr yiw:Rg <c-r>"<cr>
nnoremap <leader>fj :%!python -m json.tool

nnoremap glog yiwoconsole.log('<c-r>"', <C-r>")<Esc>
nnoremap glos yiwoconsole.log(JSON.stringify(<C-r>", null, 2))<Esc>
nnoremap gloc oconsole.log('')<Left><Left>

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -

set autoread
autocmd FocusGained * :checktime

:set clipboard=unnamedplus

:set foldmethod=syntax
:set foldlevel=20

set noswapfile

nmap <Leader>i O//@ts-ignore FIXME<Esc>
nmap <Leader>I O{/*@ts-ignore FIXME*/<Esc>


