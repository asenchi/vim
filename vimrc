" vimrc
" author: curt micol
" email: asenchi@asenchi.com

set nocompatible

" some visuals
set ruler
set title
set showcmd
set cursorline
set number

" statusline
set laststatus=2
set ch=1

set ffs=unix,dos,mac
set history=1000
set visualbell

set splitbelow
set autoindent
set smartindent
set scrolloff=3

" search
set showmatch
set incsearch
set ignorecase

" whitespace
set shiftwidth=4
set softtabstop=4
set showtabline=2
set expandtab

" text width
set linebreak
set textwidth=80

" backspace across lines and indents
set backspace=indent,eol,start

" allow us to move across lines
set whichwrap+=<,>,[,],h,l

" follow the mouse
set mousefocus

" Turn off formatting when pasting
set pastetoggle=<F6>

" backups
set backupdir=$HOME/.sessions
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap//,.,~/tmp,/tmp

" tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,.DS_Store

" leader
let mapleader = ","
let g:mapleader = ","

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$']
map <leader>d :NERDTreeToggle<CR>

" gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" fugitive
let g:fugitive_git_executable = '/Users/asenchi/Developer/bin/git'

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
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" change path across all windows
nmap <leader>cd :cd%:p:h<CR>
" change path locally
nmap <leader>lcd :lcd%:p:h<CR>

" new line
nmap <CR> o<Esc>

" view registers
nmap <leader>r :registers<CR>
" map registers to a leader shortcut
nmap <leader>0 "0p
nmap <leader>1 "1p
nmap <leader>2 "2p
nmap <leader>3 "3p
nmap <leader>4 "4p
nmap <leader>5 "5p
nmap <leader>6 "6p
nmap <leader>7 "7p
nmap <leader>8 "8p
nmap <leader>9 "9p

" I work mostly on a laptop, f1 gets in the ways sometimes.
map <F1> <Esc>

" Some sane shortcuts
nmap H ^
nmap L $
nmap F %

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
map gz :bdelete<cr>
map gb :bnext<cr>
map gB :bprev<cr>

syntax on
filetype plugin indent on

if has('gui_running')
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
    colorscheme github
    set columns=110

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
        colorscheme github

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

        map <D-t> :CommandT<CR>

        map <D-e> :call StartTerm()<CR>
    endif
endif

" date shortcuts
iab YMD <C-R>=strftime("%Y-%m-%d")<CR>
iab NOW <C-R>=strftime("%c")<CR>

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

set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ %r%{CurDir()}%h

let perl_include_pod = 1
let perl_extended_vars = 1

au BufRead,BufNewFile *.sql         set ft=pgsql
au BufRead,BufNewFile *.md          set ft=mkd tw=72 ts=2 sw=2 expandtab
au BufRead,BufNewFile *.markdown    set ft=mkd tw=72 ts=2 sw=2 expandtab

au FileType javascript  setlocal nocindent
au FileType mail,human  set formatoptions+=t tw=78
au Filetype gitcommit   set tw=70
au FileType text    set tw=78 formatoptions+=tcan2 equalprg=fmt
au FileType perl    set makeprg=perl\ -c\ %\ $* errorformat=%f:%l:%m autowrite
au FileType make    set noexpandtab sw=8
au FileType html    set ts=2 sw=2 sts=2
