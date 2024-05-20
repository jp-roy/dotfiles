if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" ================ GENERAL CONFIG ====================
set autoread                   " Reload files changed outside vim
set backspace=indent,eol,start " Allow backspace in insert mode
set belloff=all                " No sound
set clipboard=unnamedplus      " enable copy/pasting through vim/system clipboardv
set cursorline                 " 
set cul                        " highlights current line
set history=100                " Store lots of :cmdline history
set laststatus=2               " Status line always on display
set nobackup                   " Delete backup file upon successful save of original file
set nocompatible               " don't need to be compatible with old VI
set noshowmode                 " Hide status line (--> it is actually displayed with lightline plugin)
set noswapfile                 " turn off Swap Files
set nowritebackup              " No backup file
set number                     " Line numbers are good
set numberwidth=5              " width of line numbers area
set relativenumber             " show relative number lines
set ruler                      " show row and column in footer
set showcmd                    " Show incomplete cmds down the bottom
set showmatch                  " show bracket matches
set ttimeoutlen=0              " Doesn't wait after pressing ESC for another command
set visualbell                 " No sounds

" ================ SEARCH  ======================
set hlsearch                   " highlight all search matches
set incsearch
set wildmenu                   " enable bash style tab completion
set wildmode=list:longest,full

" ================ INDENTATION ======================
set autoindent " auto indentation
set expandtab
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" ================ CTAGS ======================
set tags+=.tags

" ================ SCROLLING ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" =============== CUSTOM REMAPS =====================
nnoremap <SPACE> <Nop>
let mapleader=" "              " Map Leader key to <Space>

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Git blame
noremap <leader>b :Git blame<ENTER>

" open buffer list and switch to buffer
nnoremap <leader>l :ls<CR>:b<Space>

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

" Map Ctrl + m to open marks
nnoremap <leader>m :Marks<cr>

" Search last Rg
noremap <leader>a q:?Rg<cr><cr>

" Search from clipboard with Rg
noremap <leader>g :Rg <C-R>+<ENTER>

" bind \ (backward slash) to grep shortcut
nnoremap \ :Rg<SPACE>

" Open NERDTree
noremap <leader>o :NERDTreeToggle<ENTER>

" Save and run current test
nnoremap <leader>t <esc>:w<cr>:call VimuxRunCommand("clear; rspec " . bufname("%"))<cr>

" Buffers
noremap <leader>n :enew<ENTER>
noremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" https://github.com/tpope/gem-ctags
nnoremap <leader>c :!gem install gem-ctags ; gem ctags ; ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp .<cr>
nnoremap <leader>f <C-]>
nnoremap <leader>s :tselect<CR>

" Edit .vimrc
nmap <leader>v :e $MYVIMRC<CR>

nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" ================ PLUGINS ========================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
 Plug 'AndrewRadev/splitjoin.vim'                      " Switch between single-line and multiline forms of code
 Plug 'Eliot00/git-lens.vim'                           " Shows git blame info in the sign column and on hover
 Plug 'ap/vim-css-color'                               " highlight hex values with their color
 Plug 'christoomey/vim-tmux-navigator'                 " Easily navigate between tmux / vim panes
 Plug 'github/copilot.vim'                             " Uses GitHub API to suggest completions for current line
 Plug 'wojciechkepka/vim-github-dark'                  " github dark theme
 Plug 'godlygeek/tabular'                              " align stuff... like these vim comments
 Plug 'itchyny/lightline.vim'                          " customize status bar
 Plug 'itchyny/vim-cursorword'                         " highlights all occurrences of current word under cursor
 Plug 'jiangmiao/auto-pairs'                           " automatically closes brackets
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " fuzzy search for files
 Plug 'junegunn/fzf.vim'                               " fuzzy search for files
 Plug 'machakann/vim-highlightedyank'                  " highlights yanked chunk
 Plug 'mattn/emmet-vim'                                " expand abbreviations similar to emmet.
 Plug 'msanders/snipmate.vim'                          " snippets
 Plug 'preservim/nerdtree'                             " file browser
 Plug 'preservim/vimux'                                " Run command in tmux split
 Plug 'sheerun/vim-polyglot'                           " syntax highlighting for many languages
 Plug 'stefandtw/quickfix-reflector.vim'               " Mass edit in quickfix window
 Plug 'tpope/vim-bundler'                              " Goodies for bundler. Required for ctags gem inspection
 Plug 'tpope/vim-commentary'                           " comment stuff out, like these comments
 Plug 'tpope/vim-dispatch'                             " Asynchronous build and test dispatcher
 Plug 'tpope/vim-eunuch'                               " UNIX shell commands
 Plug 'tpope/vim-fugitive'                             " git wrapper
 Plug 'tpope/vim-rails'                                " Editing RoR apps. Required for ctags gem inspection
 Plug 'tpope/vim-repeat'                               " Repeat.vim remaps `.` in a way that plugins can tap into it
 Plug 'tpope/vim-surround'                             " change and add surrounds, []()''...

 " Nerdtree plugins to be initialized after
 Plug 'PhilRunninger/nerdtree-visual-selection'        " Open multiple files via NerdTree
 Plug 'ryanoasis/vim-devicons'                         " display cool icons in NerdTree
call plug#end()

" ================ APPEARANCE ======================
colorscheme ghdark
set background=dark
let g:gh_color = "soft"

" ================ SYNTAX ======================
syntax on
autocmd BufNewFile,BufRead *.arb set syntax=ruby
autocmd BufRead,BufNewFile *.arb setfiletype ruby

" Git lens configuration
let g:GIT_LENS_ENABLED = 1

" lightline plugin config
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified' ] ],
      \   'right': [ [ 'filename', 'filetype', 'lineinfo' ] ],
      \ },
      \ 'component': {
      \   'lineinfo': "%{line('.') . '/' . line('$')}",
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \ },
      \ 'enable': { 'tabline': 0 },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" highlightedyank
let g:highlightedyank_highlight_duration = 200
highlight HighlightedyankRegion cterm=reverse gui=reverse

" Vim Tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Vimux
let g:VimuxHeight = "50"
let g:VimuxOrientation = "v"

" ================ NERDTree ======================
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 40

" ================ FZF ======================
" Populate results in quickfix
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let $FZF_DEFAULT_COMMAND='rg --files --hidden'

" Override default command to show hidden files except gitignore
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --hidden --smart-case --color=always '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

runtime macros/matchit.vim

" Source vim configuration file whenever it is saved
command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

augroup Reload_Vimrc       " Group name.  Always use a unique name!
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
  LightlineReload
augroup END

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd FocusGained,VimEnter,WinEnter,BufWinEnter * setlocal relativenumber
  autocmd FocusGained,VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  " autocmd FocusGained,VimEnter,WinEnter,BufWinEnter * setlocal number
  autocmd FocusLost,WinLeave * setlocal nocursorline
  autocmd FocusLost,WinLeave * setlocal norelativenumber
  " autocmd FocusLost,WinLeave * setlocal nonumber
augroup END
