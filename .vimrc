" install vim plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" install plugins {{{
call plug#begin('~/.vim/bundle')

Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jpalardy/vim-slime'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'dense-analysis/ale'

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

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

" omni complete
set omnifunc=syntaxcomplete#Complete

" encoding
set encoding=utf-8

" backspace behaviour
set backspace=2

" change grep prg
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" split location
set splitright
set splitbelow

" set dict
set dictionary=/usr/share/dict/words

" indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set breakindent
set showbreak=>>
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

" highlight
hi CursorLine term=bold cterm=bold

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

" open new split with hgcommit filetype containing diff of commit files
augroup HgCommitDiff
  autocmd!
  autocmd BufReadPost * if &ft ==# 'hgcommit' | :new | execute 'r!hg diff $(cat $(hg root)/.hg/current-commit-files.txt)' | set filetype=diff | :0 | :resize 44 | endif
augroup END
" }}}

" swap/backup/undo {{{
" swap
set directory=~/.vim/swapdir//

" undo
set undofile
set undodir=~/.vim/undodir

" backup
set backupdir=~/.vim/backupdir//
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
nnoremap <Leader>yfl :let @*=join([expand('%'), line('.')], ':')<CR>

" buffer navigation
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader><Left> :bprevious<CR>
nnoremap <Leader><Right> :bnext<CR>

" remap esc
inoremap jk <Esc>
" }}}

" copy {{{
if system('uname -r') =~ "Microsoft"
    let s:clip = $MNT.'/c/Windows/System32/clip.exe'
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
        augroup END
    end
end
" }}}

" ultisnips settings {{{
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir='~/.vim/snippets'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/snippets/UltiSnips']
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
" }}}

" ale settings {{{
" fixers
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}

" php
let g:ale_linters = {'php': ['phpcs', 'phpmd'], 'javascript': ['eslint']}

" mappings
nnoremap <Leader>at :ALEToggle<CR>
" }}}

" vimwiki settings {{{
" disable table mapping
let g:vimwiki_table_mappings = 0

let g:vimwiki_list= [{
    \ 'path': $HOME.'/Notes/',
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
    \           : fzf#vim#with_preview('right:50%', '?'),
    \   <bang>0)

command! -bang HFiles
    \ call fzf#run({'source': 'hg manifest', 'sink': 'e'}) 
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

set modelines=1
" vim:foldmethod=marker:foldlevel=0
