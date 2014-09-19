
syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ########################################## PLUGINS / BUNDLES #######
Plugin 'majutsushi/tagbar'
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Plugin 'fatih/vim-go'
Bundle 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ################################################# Functions ####
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imT')
  else
    exec('set guioptions=i')
  endif
endfunction

" ################################################# Config ########
colorscheme slate

set guioptions=i
set mouse=a
set backupdir=~/.vim/tmp/backup/" backups
set directory=~/.vim/tmp/swap/" swap files
set backup " enable backup

let g:neocomplete#enable_at_startup = 1 
let g:neocomplete#disable_auto_complete=1
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"

let g:airline#extensions#tabline#enabled = 1

let NERDTreeShowHidden=1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	
" ############################################### Key Mapping #####
nmap <F2> :GoDoc<CR>
nmap <F4> :GoBuild<CR>
nmap <F5> :GoRun<CR>
nmap <F5> :GoRun %<CR>
nmap <F7> :!go test<CR>
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>
nmap <F10> :call ToggleGUICruft()<cr>
nmap <C-Tab> :bn<CR>pumvisible() ? "\<C-n>" : "\<TAB>"

nmap <C-S-Tab> :bp<CR>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

set clipboard=unnamed
set go+=a
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
