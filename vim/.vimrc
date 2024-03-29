" install vim plug {{{
if empty(glob($HOME . '/.vim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" install plugins {{{
call plug#begin($HOME . '/.vim/bundle')

Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-vdebug/vdebug'
Plug 'vimwiki/vimwiki'

call plug#end()
" }}}

" colors {{{
" enable syntax processing
syntax enable

" color scheme
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" background
set background=dark
" }}}

" misc {{{
" vim history size
set history=500

" external vimrc
set exrc
set secure

" set modeline
set modeline

" set hidden
set hidden

" set updatetime
set updatetime=300

" set cmdheight
set cmdheight=2

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

" omni complete
set omnifunc=syntaxcomplete#Complete
set completeopt=menu

" encoding
set encoding=utf-8

" backspace behaviour
set backspace=2

" change grep prg
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" split location
set splitright
set splitbelow

" set dict
if !empty(glob('/usr/share/dict/words'))
    set dictionary=/usr/share/dict/words
endif

" indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set breakindent
set showbreak=>>

" make mouse work beyond 223 column
set ttymouse=sgr
" }}}

" visual stuff {{{
" line numbers
set number
set relativenumber

" highlight current line
set cursorline

" visual autocomplete for command menu
set wildmenu

" ruler
set ruler

" folding
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" redraw only when we need to
set lazyredraw

" show tabs and space as chars
set list
set listchars=tab:→\ ,space:·

" scrolling
set mouse=a

" text width
set textwidth=79
set colorcolumn=80

" syntax redraw time
set redrawtime=10000
" }}}

" filetype {{{
filetype plugin on
filetype indent on
" }}}

" swap/backup/undo {{{
" swap
set directory=$HOME/.vim/swapdir//

" undo
set undofile
set undodir=$HOME/.vim/undodir

" backup
set backupdir=$HOME/.vim/backupdir//
" }}}

" mappings {{{
map <Space> <Leader>

" current date
inoremap <Leader>date <C-R>=strftime('%c')<CR>

" current date - ymdhis
inoremap <Leader>ymdhis <C-R>=strftime('%Y%m%d%H%M%S')<CR>

" clear highlighting
nnoremap <Leader>\ :noh<CR>

" copy current-file:line-number to clipboard
nnoremap <Leader>yfl :let @+=join([expand('%'), line('.')], ':')<CR>

" buffer navigation
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader><Left> :bprevious<CR>
nnoremap <Leader><Right> :bnext<CR>

" remap esc
inoremap jk <Esc>
" }}}

" ultisnips settings {{{
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir=$HOME . '/.vim/snippets'
let g:UltiSnipsSnippetDirectories=[$HOME . '/.vim/snippets/UltiSnips']
" }}}

" nerdtree settings {{{
let NERDTreeShowHidden=1

" mappings
nnoremap <Leader>b :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
" }}}

" airline settings {{{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1
" }}}

" ale settings {{{
" fixers
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'javascript': ['eslint']
    \ }

" linters
let g:ale_linters = {
    \ 'php': ['phpcs', 'phpmd'],
    \ 'javascript': ['eslint'],
    \ 'javascriptreact': ['eslint']
    \ }

" mappings
nnoremap <Leader>at :ALEToggle<CR>
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>ap :ALEPrevious<CR>
" }}}

" vimwiki settings {{{
" disable table mapping
let g:vimwiki_table_mappings = 0

let g:vimwiki_list= [{
    \ 'path': $HOME . '/Notes/',
    \ 'auto_tags': 1,
    \ 'ext': '.md',
    \ 'syntax': 'markdown'
    \ }]
" }}}

" fzf settings {{{
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
    \   <bang>0)
" }}}

" tagbar settings {{{
" mappings
nnoremap <Leader>tt :TagbarToggle<CR>
" }}}

" signify settings {{{
" vcs list
let g:signify_vsc_list = [ 'git', 'hg' ]

" disable by default
let g:signify_disable_by_default = 1

" mappings
nnoremap <Leader>st :SignifyToggle<CR>
nnoremap <Leader>sd :SignifyDiff<CR>
" }}}

" slime settings {{{
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
" }}}

" coc settings {{{
let g:coc_global_extensions = [
    \ 'coc-html', 'coc-css', 'coc-json', 'coc-tag', 'coc-phpls',
    \ 'coc-dictionary', 'coc-rust-analyzer'
    \ ]

" mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" fix coc completion menu colors
hi CocMenuSel ctermbg=237 guibg=#3c3836
" }}}

" open-browser settings {{{
let g:netrw_nogx = 1

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" }}}

set modelines=1
" vim:foldmethod=marker:foldlevel=0:nolist
