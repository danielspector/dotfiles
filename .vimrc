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
Plugin 'w0ng/vim-hybrid'
Plugin 'ajh17/Spacegray.vim'

" Plugins
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-bundler'
Plugin 'guns/vim-clojure-static'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-commentary'
Plugin 'eudisd/vim-csapprox'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-rails'
Plugin 'airblade/vim-rooter'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-dispatch'
Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-classpath'
Plugin 'burnettk/vim-angular'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'tpope/vim-haml'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-repeat'
Plugin 'amdt/vim-niji'
Plugin 'dgrnbrg/vim-redl'
Plugin 'vim-scripts/dbext.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'guns/vim-clojure-highlight'

call vundle#end()            " required
filetype plugin indent on    " required

" Settings for ultisnips
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Settings for ctrl-p

let g:ctrlp_open_new_file = 'r'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|tags\|target\'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*,*/tags/*,tags

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
let g:solarized_termcolors=256
set background=dark
colorscheme hybrid
set t_Co=256
hi LineNr ctermfg=236
hi Search cterm=NONE ctermfg=grey ctermbg=blue
" Enable syntax highlighting
syntax on
set hlsearch
set guifont=Monaco:h12
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

" Handle syntax highlighting for hamlbars.
au BufReadPost *.hamlbars set syntax=haml
let g:mustache_abbreviations = 1

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
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap <C-o> <esc>o

runtime! macros/matchit.vim
set pastetoggle=<Leader>z

" Ctags ftw
" Stolen from http://blog.gonzih.me/blog/2013/03/18/how-i-cook-ctags-in-vim/

" If tags file does not exist initializes it with symlink to tmp with UUID in
" filename
function! InitTagsFileWithSymlink(f)
  let filepath = a:f
  let issymlink = system("find '" . filepath . "' -type l | wc -l")
  if issymlink == 0
    let uuid = system('uuidgen')
    let cmd  = 'ln -s "/tmp/ctags-for-vim-' . uuid . '" "' . filepath . '"'
    let cmd  = substitute(cmd, '\n', '', 'g')
    let resp = system(cmd)
  endif
endfunction

" Populates tags file if lines count is equal to 0
" with `ctags -R .`
function! PopulateTagsFile(f)
  let filepath = a:f
  let resp     = system('touch "' . filepath . '"')
  let lines    = system('wc -l "' . filepath . '"')
  let linescnt = substitute(lines, '\D', '', 'g')
  if linescnt == 0
    let cwd  = getcwd()
    let cmd  = 'ctags -Rf "'. filepath . '" "' . cwd . '"'
    let resp = system(cmd)
  endif
endfunction

" Remove tags for saved file from tags file
function! DelTagOfFile(file)
  let fullpath    = a:file
  let cwd         = getcwd()
  let tagfilename = cwd . "/tags"
  let f           = substitute(fullpath, cwd . "/", "", "")
  let f           = escape(f, './')
  let cmd         = 'sed --follow-symlinks -i "/' . f . '/d" "' . tagfilename . '"'
  let resp        = system(cmd)
endfunction

" Init tags file
" Populate it
" Remove data related to saved file
" Append it with data for saved file
function! UpdateTags()
  let f           = expand("%:p")
  let cwd         = getcwd()
  let tagfilename = cwd . "/tags"
  call InitTagsFileWithSymlink(tagfilename)
  call PopulateTagsFile(tagfilename)
  call DelTagOfFile(f)
  let cmd  = 'ctags -a -f ' . tagfilename . ' "' . f . '"'
  let resp = system(cmd)
endfunction

"command UpdateTags call UpdateTags()
autocmd BufWritePost *.rb,*.js,*.coffee,*.clj call UpdateTags()
