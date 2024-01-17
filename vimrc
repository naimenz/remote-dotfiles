" Weird fix for weird characters,good
" https://stackoverflow.com/questions/62148994/strange-character-since-last-update-42m-in-vim
let &t_TI = ""
let &t_TE = ""
" https://vi.stackexchange.com/questions/27399/whats-t-te-and-t-ti-added-by-vim-8/
set t_u7=
set t_RV=
" Bits from old vimrc
"
" toggling number for copying
nnoremap <F2> :set number!<CR>:set relativenumber!<CR>

set number " shows current line number
set relativenumber " shows other line numbers relative to current line

" changing the colour of the current line when in insert mode 
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
"
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set showcmd " shows commands as they are being typed

set tabstop=2 " number of cols in a tab
set softtabstop=2 " number of spaces in a tab or something?
set expandtab " use spaces instead of tabs
set shiftwidth=2 " 4 columns per tab

set hlsearch " turn search highlighting on

" VIM-PLUG STUFF

" Install vim-plug if it's not there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run plugins 
call plug#begin('~/.vim/bundle/')
" color scheme
Plug 'ajmwagar/vim-deus' 
Plug 'tpope/vim-surround'
" So that . works with surround.vim
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
"

colors deus " Activate the colorscheme 
