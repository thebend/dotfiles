set nocompatible
set encoding=utf-8 fileencoding=utf-8

" Relative line numbers except current line
set number relativenumber

" Interface
set ruler
set showcmd
set wildmenu wildmode=list:longest,full
set autoread
set showmatch
set guifont=Inconsolata\ for\ Powerline:h12
set clipboard=unnamed

" Formatting
set list listchars=tab:\»\ ,trail:·
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
set colorcolumn=72
autocmd FileType text setlocal colorcolumn=0
set wrap
set backspace=eol,start
" Don't auto-insert comment leader characters on o/O commands
augroup NoAutoCommentLeaders
	autocmd!
	autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=o
augroup END

" Searching
set hlsearch
set incsearch wrapscan
set ignorecase smartcase

" Vundle Plugins
" Run BundleInstall to download/update plugins
" Run bundleClean to remove undocumented plugins
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-airline/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'PProvost/vim-ps1'

" Syntax handling
filetype plugin indent on
syntax enable
colorscheme solarized
set background=dark

" Airline
let g:airline_powerline_fonts=1
" let g:airline_theme="tomorrow"
let g:airline_theme="papercolor"
" Always enable status bar
set laststatus=2

" Shortcuts
nnoremap <F2> :NERDTreeToggle<CR>
" Insert newline below
nnoremap <CR> o<Esc>
" Switch to next pane
nnoremap <Tab> <c-w>l
" Switch to previous pane
nnoremap <S-Tab> <c-w>h
" Switch to next tab
nnoremap <C-Tab> :tabn<CR>
" Switch to previous tab
nnoremap <C-S-Tab> :tabp<CR>

" Close vim entirely if only NERDTree left
function! s:CloseIfOnlyControlWinLeft()
	if winnr("$") != 1
		return
	endif
	if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
			\ || &buftype == 'quickfix'
		q
	endif
endfunction
augroup CloseIfOnlyControlWinLeft
	autocmd!
	autocmd BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

if has("win32")
	map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

autocmd BufNewFile,BufRead *.ps1 setfiletype ps1

