" vimrc
" author: curt micol
" email: asenchi@asenchi.com

set nocompatible
set ffs=unix,dos,mac
set history=1000
set visualbell

set title
set showcmd
set ruler
set laststatus=2
set modeline
set cursorline
set ch=1
set splitbelow
set scrolloff=3
set showmatch
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set incsearch
set linebreak
set textwidth=80
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l
set mousefocus
set pastetoggle=<F6>
set autoindent
set smartindent
set nostartofline
set showtabline=2
set tabpagemax=50
set guitablabel=%{GuiTabLabel()}
set number
set backupdir=$HOME/.sessions
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap//,.,~/tmp,/tmp

let mapleader = ","
let g:mapleader = ","

" toggle line numbers
map <leader>n :set number<CR>
map <leader>N :set nonumber<CR>

" open vimrc in a split window
map <leader>v :sp ~/.vimrc<CR><C-W>_

" source vim and let me know.
map <leader>V :source ~/.vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>

map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" quick write
nmap <leader>w :w<CR>
nmap <leader>W :w!<CR>

" change path across all windows
nmap <leader>cd :cd%:p:h<CR>
" change path locally
nmap <leader>lcd :lcd%:p:h<CR>

" new line
nmap <CR> o<Esc>

" view registers
nmap <leader>r :registers<CR>

" map the various registers to a leader shortcut for pasting from them
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

set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
map <C-q> :mksession! ~/.sessions/session.vim<cr>
map <C-s> :source ~/.sessions/session.vim<cr>

" I work mostly on a laptop, f1 gets in the ways sometimes.
map <F1> <Esc>

" Some sane shortcuts
nmap H ^
nmap L $
nmap F %

" mimic some common emacs keys
imap <C-a> <C-o>0
imap <C-e> <C-o>$
map <C-e> $
map <C-a> 0

" toggle the NERDTree directory listing
map <leader>D :NERDTreeToggle<CR>

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

highlight Comment ctermfg=DarkGrey guifg=#333333
highlight StatusLineNC ctermfg=Black ctermbg=DarkGrey cterm=bold
highlight StatusLine ctermbg=Black ctermfg=LightGrey
set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black

if has('gui_running')
    set encoding=utf-8
    set columns=110
    set lines=46
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
        set guifont=Menlo\ Regular:h16
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
    endif
endif

" date shortcuts
iab YMD <C-R>=strftime("%Y-%m-%d")<CR>
iab NOW <C-R>=strftime("%c")<CR>

" django abbreviations
ab djbl <Esc>bi{% block <Esc>ea %}{% endblock %}<Esc>h%i
ab djcy <Esc>bi{% cycle '' '' as <Esc>ea %}<Esc>h%2w
ab djfo <Esc>i{% firstof %}<Esc>3ha
ab djfi <Esc>i{% filter %}<CR>{% endfilter %}<Esc>kh%2Ea
ab djifchg <Esc>i{% ifchanged %}{% endifchanged %}<Esc>h%i
ab djifeql <Esc>i{% ifequal %}{% endifequal %}<Esc>h2%2Ea
ab djifneql <Esc>i{% ifnotequal %}{% endifnotequal %}<Esc>h2%2Ea
ab djinc <Esc>^i{% include <Esc>$a %}<Esc>
ab djext <Esc>^i{% extends <Esc>$a %}<Esc>
ab djspaceless <Esc>i{% spaceless %}<CR>{% endspaceless %}<Esc>h%i
ab djssi <Esc>i{% ssi %}<Esc>2hi
ab djurl <Esc>i{% url %}<Esc>2hi
ab djload <Esc>i{% load %}<Esc>2hi

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

set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ %r%{CurDir()}%h

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let g:manpageview_pgm= 'man -P "/usr/bin/less -is"'
let $MANPAGER = '/usr/bin/less -is'

let perl_include_pod = 1
let perl_extended_vars = 1

au BufRead,BufNewFile *.sql         set ft=pgsql
au BufRead,BufNewFile *.md          set ft=mkd tw=72 ts=2 sw=2 expandtab
au BufRead,BufNewFile *.markdown    set ft=mkd tw=72 ts=2 sw=2 expandtab

au FileType javascript  setlocal nocindent
au FileType mail,human  set formatoptions+=t tw=72
au Filetype gitcommit   set tw=70
au FileType text    set tw=78 formatoptions+=tcan2 equalprg=fmt
au FileType perl    set makeprg=perl\ -c\ %\ $* errorformat=%f:%l:%m autowrite
au FileType make    set noexpandtab sw=8
au FileType html    set ts=2 sw=2 sts=2
au Filetype html,xml,xsl source $HOME/.vim/scripts/closetag.vim
