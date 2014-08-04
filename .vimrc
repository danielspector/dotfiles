set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colorscheme
Bundle 'w0ng/vim-hybrid'

" Plugins
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tpope/vim-bundler'
Bundle 'guns/vim-clojure-static'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-commentary'
Bundle 'eudisd/vim-csapprox'
Bundle 'tpope/vim-fugitive'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'tpope/vim-rails'
Bundle 'airblade/vim-rooter'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-fireplace'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-dispatch'
Bundle 'bling/vim-airline'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'myusuf3/numbers.vim'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-classpath'
Bundle 'burnettk/vim-angular'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'matthewsimo/angular-vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required

" Settings for ultisnips
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Settings for ctrl-p

let g:ctrlp_open_new_file = 'r'

" Settings for NERDtree

let g:NERDTreeMouseMode=2

" Settings for vim-airline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols.space = "\ua0"

set laststatus=2
let g:airline_theme='wombat'

" Settings for numbers.vim

let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

" iTerm2 specific settings for colorscheme
let g:hybrid_use_iTerm_colors = 1
color hybrid
set t_Co=256
hi LineNr ctermfg=236
hi Search cterm=NONE ctermfg=grey ctermbg=blue
" Enable syntax highlighting
syntax on
set hlsearch
set guifont=Monaco:h14
set shell=zsh
set ignorecase
set nobackup
set noswapfile
set expandtab
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set splitbelow
set splitright
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set grepprg=ag
set number
if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
endif


function! s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()
augroup END

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set tags+=gems.tags
nnoremap <Space><Space> <c-^>

" From r00k
let mapleader = ","

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>
:imap <c-s> <Esc><c-s>
map <Leader>cs :w<cr>cpr
map <Leader>rd :!bundle exec rspec % --format documentation<CR>
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <Leader>w :StripWhitespace<CR>
map <Leader>q :noh<CR>
map <Leader>n :bn<CR>
map <Leader>p :bp<CR>
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
map <Leader>sc :w<CR>cpr
imap <Leader>sc <Esc>:w<CR>cpr
noremap cp yap<S-}>p
noremap <Leader>a ggVG=ip
runtime! macros/matchit.vim
set pastetoggle=<Leader>z

map <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!bin/cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!bundle exec rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!bin/rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction
