" vimrc
" author: curt micol
" email: asenchi@asenchi.com

" A must for all VIM's
set nocompatible

" some visuals
set ruler
set title
set showcmd
set relativenumber

" statusline
set laststatus=2
set ch=1

set ffs=unix,dos,mac
set history=1000
set visualbell

set autoindent
set smartindent
set scrolloff=3

" search
set showmatch
set incsearch
set ignorecase

" whitespace
set tabstop=8
set shiftwidth=4
set softtabstop=4
set showtabline=2
set expandtab

" text width
set linebreak
set textwidth=78

" backspace across lines and indents
set backspace=indent,eol,start

" allow us to move across lines
set whichwrap+=<,>,[,],h,l

" hide the mouse while typing
set mousehide

" Turn off formatting when pasting
set pastetoggle=<F6>

" match angle brackets
set matchpairs+=<:>

" backups
set backupdir=~/.vim/sessions
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap//,.,~/tmp,/tmp

" tab completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,.DS_Store,*.jpg,*.png,*.gif
set wildmode=list:full

" leader
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$']
map <leader>d :NERDTreeToggle<CR>

" gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" fugitive
let g:fugitive_git_executable = '~/Developer/bin/git'

" manpages
let g:manpageview_pgm= 'man -P "/usr/bin/less -is"'
let $MANPAGER = '/usr/bin/less -is'

" toggle line numbers
map <leader>n :set number<CR>
map <leader>N :set nonumber<CR>

" open vimrc in a split window
map <leader>v :tabe ~/.vimrc<CR>
" source vim and let me know.
map <leader>V :source ~/.vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>

" quick write
nmap <leader>w :w<CR>
nmap <leader>W :w!<CR>

" shortcuts for appending local path
map <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" change path across all windows
nmap <leader>cd :cd%:p:h<CR>
" change path locally
nmap <leader>. :lcd%:p:h<CR>

" new line
nmap <CR> o<Esc>

" view registers
nmap <leader>r :registers<CR>

" Some nice reST shortcuts.
noremap <leader>h1 yypVr=
noremap <leader>h2 yypVr-

" remove search hilight
nnoremap <leader><space> :nohlsearch<CR>

" I work mostly on a laptop, f1 gets in the ways sometimes.
map <F1> <Esc>

" Some sane shortcuts
nmap H ^
nmap L $
nmap F %
nmap Y y$

" tab for brackets
nnoremap <tab> %
vnoremap <tab> %

" fill window with buffer
nmap <leader>F <C-W>_

" mimic some common emacs keys
imap <C-a> <C-o>0
imap <C-e> <C-o>$
map <C-e> $
map <C-a> 0

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

" tabs!
map tn <Esc>:tabnext<cr>
map tp <Esc>:tabprev<cr>
map tc <Esc>:tabnew<cr>
map td <Esc>:tabclose<cr>
map tm <Esc>:tabmove<cr>

" buffers!
map <C-b> <Esc>:BufExplorer<cr>

syntax on
filetype on
filetype plugin indent on

if has('gui_running')
    set cursorline
    set encoding=utf-8
    set guioptions+=c
    set guioptions-=b
    set guioptions-=T
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guifont=Inconsolata:h14
    colorscheme molokai
    set columns=179
    set lines=50

    " C-# switches to tab
    nmap <d-1> :tabn 1
    nmap <d-2> :tabn 2
    nmap <d-3> :tabn 3
    nmap <d-4> :tabn 4
    nmap <d-5> :tabn 5
    nmap <d-6> :tabn 6
    nmap <d-7> :tabn 7
    nmap <d-8> :tabn 8
    nmap <d-9> :tabn 9

    nmap <c-tab> :tabnext<cr>
    imap <c-tab> <c-o>:tabnext<cr>
    vmap <c-tab> <c-o>:tabnext<cr>
    nmap <c-s-tab> :tabprevious<cr>
    imap <c-s-tab> <c-o>:tabprevious<cr>
    vmap <c-s-tab> <c-o>:tabprevious<cr>

    if has('gui_macvim')
        set guifont=Menlo\ Regular:h14
        set fuoptions=maxvert,maxhorz
        colorscheme molokai

        map <D-1> :tabn 1<CR>
        map <D-2> :tabn 2<CR>
        map <D-3> :tabn 3<CR>
        map <D-4> :tabn 4<CR>
        map <D-5> :tabn 5<CR>
        map <D-6> :tabn 6<CR>
        map <D-7> :tabn 7<CR>
        map <D-8> :tabn 8<CR>
        map <D-9> :tabn 9<CR>
        map! <D-1> <C-O>:tabn 1<CR>
        map! <D-2> <C-O>:tabn 2<CR>
        map! <D-3> <C-O>:tabn 3<CR>
        map! <D-4> <C-O>:tabn 4<CR>
        map! <D-5> <C-O>:tabn 5<CR>
        map! <D-6> <C-O>:tabn 6<CR>
        map! <D-7> <C-O>:tabn 7<CR>
        map! <D-8> <C-O>:tabn 8<CR>
        map! <D-9> <C-O>:tabn 9<CR>
        set antialias

        map <leader>o :CommandT<CR>
        map <leader>e :call StartTerm()<CR>
    endif
else
    colorscheme desert
endif

" date shortcuts
iab YMD <C-R>=strftime("%Y-%m-%d")<CR>
iab NOW <C-R>=strftime("%c")<CR>

" toggle between number and relative number on ,l
nnoremap <leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if &number
    set relativenumber
  else
    set number
  endif
endfunction

function! CurDir()
    let curdir = substitute(getcwd(), "/Users/asenchi", "~", "g")
    return curdir
endfunction

function! GuiTabLabel()
    " add the tab number
    let label = '['.tabpagenr()
    " modified since the last save?
    let buflist = tabpagebuflist(v:lnum)
    for bufnr in buflist
            if getbufvar(bufnr, '&modified')
                    let label .= '*'
                    break
            endif
    endfor
    " count number of open windows in the tab
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
            let label .= ', '.wincount
    endif
    let label .= '] '
    " add the file name without path information
    let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
    let label .= fnamemodify(n, ':t')
    return label
endfunction

function! Browser()
    let line0 = getline (".")
    let line = matchstr (line0, "http[^ )]*")
    let line = escape (line, "#?&;|%")
    exec ':silent !open ' . "\"" . line . "\""
endfunction
map ,b :call Browser()<CR>

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,S :call StripWhitespace ()<CR>

function! StartTerm()
    ConqueTermTab zsh --login
    setlocal listchars=tab:\ \
endfunction

function! Touch(file)
    execute "!touch " . a:file
    call s:UpdateNERDTree(1)
endfunction

set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ %r%{CurDir()}%h\ %{fugitive#statusline()}

au BufRead,BufNewFile *.sql         setlocal ft=pgsql
au BufRead,BufNewFile *.md          setlocal ft=mkd tw=78 ts=2 sw=2 expandtab
au BufRead,BufNewFile *.markdown    setlocal ft=mkd tw=78 ts=2 sw=2 expandtab
au BufRead,BufNewFile *.rst         setlocal ft=rst tw=78 ts=4 sw=4 expandtab

au FileType javascript  setlocal nocindent
au FileType mail,human  setlocal formatoptions+=t tw=78
au Filetype gitcommit   setlocal tw=70
au FileType txt,text    setlocal tw=78
au FileType perl    setlocal makeprg=perl\ -c\ %\ $* errorformat=%f:%l:%m autowrite
au FileType make    setlocal noexpandtab sw=8
au FileType html    setlocal ts=2 sw=2 sts=2
let html_no_rendering=1
au FileType python  setlocal complete+=k~/.vim/syntax/python.vim "isk+=.,(
