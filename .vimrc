" .vimrc File.
" Author: Fabio Cevasco <h3rald@h3rald.com>

set backup
if has("win32") || has("win16")
	let osys="windows"
	let &guifont="Consolas:h9:cANSI"
	set lines=35
	set columns=120
	set backupdir=C:\temp
	set dir=C:\temp
	let $vimrc = $VIM."\\_vimrc"
	let $scrapbook = "D:\\Documents\\Work\\Resources\\scrapbook.textile"
else
	let osys=system('uname -s')
	let $vimrc = $HOME."/.vimrc"
	set backupdir=~/tmp
	set dir=~/tmp
	let $scrapbook = $HOME."/scrapbook.textile"
endif

behave xterm
if !has("gui_running")
	set t_Co=256
endif

set backspace=2 
set hlsearch
set history=100
set number
set tabstop=2
set shiftwidth=2
set expandtab
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ENC=%{strlen(&fenc)?&fenc:'none'}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
set showcmd
set errorbells
set visualbell
set nowarn
set wrap
set lbr
set bg=dark
set nocompatible      
set cursorline
set cursorcolumn
set autoindent
set smartindent

execute pathogen#infect()
syntax on            
filetype plugin indent on

colorscheme herald

" Key Mappings 
map! ,, `
map ,, `
map! ,- ~
map ,- ~
map! ,s <C-V>u00A7
imap èè <Esc>
"map <A-.> :exe ":edit ". $scrapbook <CR> 
nmap • :exe ":edit ". $scrapbook <CR> 
"map <A-_> :exe ":source ". $vimrc <CR> 
nmap — :exe ":source ". $vimrc <CR> 
"map <A-,> :exe ":edit ". $vimrc <CR> 
nmap … :exe ":edit ". $vimrc <CR> 
"nmap <A-j> :JSHint<CR>
nmap ª :JSHint<CR>

cabbrev E Explore

" Filetypes
au BufNewFile,BufRead *.textile,*.txtl set filetype=textile
au BufNewFile,BufRead *.clj,*.clojure set filetype=clojure
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.bbcode,*.bbc set filetype=bbcode
au BufNewFile,BufRead *.io,*.iorc set filetype=io
au BufNewFile,BufRead *.glyph set filetype=glyph
au BufNewFile,BufRead *.l set filetype=picolisp
au BufRead,BufNewFile *.go set filetype=go
au BufNewFile,BufRead *.nim set filetype=nimrod
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.md,*.markdown set filetype=markdown
au BufNewFile,BufRead *.min set filetype=minim
