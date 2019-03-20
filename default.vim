set number
set autoread
set showtabline=2
set laststatus=2
set hlsearch
set incsearch
set nocompatible
set tabstop=3
set shiftwidth=3
set expandtab
filetype off
color desert

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Your Vundle plugins go here.
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'easymotion/vim-easymotion'
Plugin 'Shougo/vimproc.vim'          " Force install a dependency of tsuquyomi.
Plugin 'leafgarland/typescript-vim'  " enables TypeScript syntax-highlighting.
"Plugin 'Quramy/tsuquyomi'            " enables TypeScript auto-completion.
Plugin 'kshenoy/vim-signature'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-haml'
Plugin 'dsawardekar/wordpress.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'StanAngeloff/php.vim'
Plugin 'tpope/vim-markdown'
call vundle#end()

augroup autoformat_settings
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType scss setlocal ts=2 sts=2 sw=2
augroup END

filetype plugin indent on
syntax on

if $COLORTERM == 'gnome-terminal'
 set t_Co=256
endif

" Set color column to 121 for html, and 81 for everything else
set colorcolumn=81
autocmd FileType html setlocal colorcolumn=121
autocmd FileType java setlocal colorcolumn=101
highlight ColorColumn ctermbg=Red guibg=Red1


" Vim
let mapleader = ","

" Vim-Session
let g:session_autosave = 'no'
let g:session_autoload= 'no'
let g:session_autosave_periodic = 1

" CtrlP
let g:ctrlp_root_markers = ['*.blueprint']

" YouCompleteMe
let g:ycm_filetype_blacklist = {'cpp': 1, 'c': 1}

" Airline
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'


" Remap keys
nmap <Leader>n :NERDTreeFind <CR>
nmap <Leader>w :w! <CR>
nmap <Leader>vp :VimwikiAll2HTML <CR>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>


" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" You Complete Me config
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']



if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }

NeoBundle 'leafgarland/typescript-vim'
"NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript setlocal completeopt+=menu,preview

" If you are using syntastic, you need to include this line in order for for it to work with
" your tsconfig settings.
let g:syntastic_typescript_tsc_fname = ''
