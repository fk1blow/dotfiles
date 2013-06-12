"--------------------------------------------------
" Character encoding
set termencoding=utf-8
set encoding=utf-8
set fileencodings^=utf-8
"set termencoding=iso-8859-2
"set encoding=iso-8859-2
"set fileencodings^=iso-8859-2

"--------------------------------------------------
" Base settings
set encoding=utf-8
set nocompatible          " We're running Vim, not Vi!
syntax on                 " syntax highlingt
set autoindent            " automatical code indent
set cindent
set smartindent
set copyindent
set backspace=2           " backspace del all
set history=1000          " history of commands
set undolevels=1000       " use muchos levels of undo
set hlsearch              " highlignt search fraze
set ts=4                  " tab stop
set sw=4                  " shift width (with autoindent)
set textwidth=2048        " text witdth
set relativenumber        " show numbers
set lcs=tab:>.,eol:$      " show non printed chars
set autowrite             " Writes on make/shell commands
set whichwrap+=<,>,[,]    " where wrap long lines
set gdefault              " /g default on s///
set showcmd               " show typed commands
set wildmenu              " show menu (bash-like) on tab
set wildignore=*.o,*~,*.swp,*.bak,*.pyc    " ignor on wildmenu
set incsearch             " show what is typed on /
set statusline=%<%f\ (%{&encoding})\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2          " always show status line
set viminfo='1000,f1,:1000,/1000  " big viminfo :)
set history=500
set lazyredraw
set wmh=0
set t_Co=256              " color numbers
set nowrap                " do not wrap lines
set ignorecase            " ignore case while searching
set smartcase             " ignore case if search pattern is all lowercase
set smarttab              " insert tabs on the start of line according to shiftwidth not tabstop
set title                 " change the terminal title
set nobackup              " never backup files
set noswapfile            " never create swap files
set cursorline
set backspace=indent,eol,start
set undofile
set ttyfast
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set cc=80                 " visual marker for the 80 character limit

"-------------------------------------------------
" ESC-c ... capitalize current word (and goto next word)
map <leader>c viwu~W
" ESC-l ... lowercase current word (and goto next word)
map <leader>l viwuW
" ESC-u ... uppercase current word (and goto next word)
map <leader>u viwUW

"--------------------------------------------------
" Word completion on <TAB>
function! InsertTabWrapper(direction)
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfunction
inoremap <Tab> <C-R>=InsertTabWrapper("backward")<CR>
inoremap <S-Tab> <C-R>=InsertTabWrapper("forward")<CR>

"--------------------------------------------------
" Duplicate line
"map! <c-d> <esc>yypi
"map <c-d> <esc>yyp

"--------------------------------------------------
" File tree on F7
map <silent> <F7> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<CR>'

"--------------------------------------------------
" Change encoding
map _u :set encoding=utf-8<cr>:set fileencodings^=utf-8<cr>:set termencoding=utf-8<cr>
map _i :set encoding=iso-8859-2<cr>:set fileencodings^=iso-8859-2<cr>:set termencoding=iso-8859-2<cr>

"--------------------------------------------------
" Open in last edit place
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

nnoremap ; :
vmap Q gq
nmap Q gqap
nmap <silent> ,/ :nohlsearch<CR>

"--------------------------------------------------
" Syntax coloring (~/.vim/colors/)
" available colors: `ls /usr/share/vim/vim??/colors`
colorscheme soruby

"---------------------------------------------------
" Tags file (use ctags)
let Tlist_Use_Right_Window = 1    " tags list on right window
:set tags=.vimtags
map <silent> <F8> :Tlist<CR>

"" remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

"---------------------------------------------------
" Tab size
:set tabstop=4        " Force tabs to be displayed/expanded to 2 spaces (instead of default 8).
:set softtabstop=4    " Make Vim treat <Tab> key as 2 spaces, but respect hard Tabs.
                      " I don't think this one will do what you want.
:set expandtab        " Turn Tab keypresses into spaces.  Sounds like this is happening to you.
                      " You can still insert real Tabs as [Ctrl]-V [Tab].
:set shiftwidth=4     " When auto-indenting, indent by this much.
                      " (Use spaces/tabs per "expandtab".)
:retab                " Change all the existing tab characters to match the current tab settings
set showmatch
set ruler
" set mouse a
" Highlight matching parens
set matchpairs=(:),[:],{:},<:>
set nocompatible
set comments=b:#,:%,fb:-,n:),n:> fo=cqrt

" KEY MAPPINGS
map to <Esc>:browse tabnew<CR>
map tn <Esc>:tabnew<CR>
map tc <Esc>:tabclose<CR>
map tf <Esc>:tabfirst<CR>
map tp <Esc>:tabp<CR>
map tx <Esc>:tabn<CR>
map tl <Esc>:tablast<CR>

" Activate Pathogen
filetype off
call pathogen#infect()
filetype plugin indent on
set hidden

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


" MACROS
map <Leader>j ddp
map <Leader>k ddkp

"""" TRICKERY """"

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Clear search highlights
noremap <silent><leader>/ :nohls<CR>

" Improved navigation on wrapped lines
nnoremap j gj
nnoremap k gk

" jk as <ESC> alternative
inoremap jk <ESC>

" Save and return to normal when focus is lost
au FocusLost * :silent! wall                 " Save on FocusLost
au FocusLost * call feedkeys("\<C-\>\<C-n>") " Return to normal mode on FocustLost

" Search for the word under the cursor
nnoremap <leader>h *<C-O>

" set <F2> for toggling paste mode
set pastetoggle=<F2>

" Force saving of files that require sudo
cmap w!! w !sudo tee > /dev/null %

" Custom invisibles
set list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" run a single line of vimscript
nnoremap <Leader>S ^vg_y:execute @@<CR>

" remove annoying <F1> help
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" select all
map <leader>a ggVG

" make <CR> in normal mode to insert a new line
nnoremap <silent> <CR> :put=''<CR>

" use system clipblard for copy/paste
set clipboard=unnamed

" Retab and reformat file with spaces
nnoremap <leader>T :set expandtab<cr>:retab!<cr>

" Open file in last edited place
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Yank entire buffer to the system register
nnoremap <silent> <F3> :%y+<CR>

" Replace entire buffer with the contents of the system register
nnoremap <silent> <S-F3> :normal ggdG"*PGgg<CR>


nnoremap <tab> %
vnoremap <tab> %

" automatically save file on focus lost
au FocusLost * :wa

" fold html tag
nnoremap <leader>ft Vatzf

" open a new vertical split
nnoremap <leader>w <C-w>v<C-w>l

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Set handlebars filetype for .hjs files
au BufNewFile,BufRead *.hjs set filetype=handlebars
au BufNewFile,BufRead *.py set fileencoding=ASCII

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
