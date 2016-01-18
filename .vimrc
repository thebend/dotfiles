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

" Formatting
set list listchars=tab:\»\ ,trail:·
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
set colorcolumn=72
autocmd FileType text setlocal colorcolumn=0
set wrap
" Don't auto-insert comment leader characters on o/O commands
autocmd BufNewFile,BufRead,BufWinEnter * setlocal formatoptions-=o

" Searching
set hlsearch
set incsearch wrapscan
set ignorecase smartcase

" Plugins
" Auto-import ~/.vim/bundle/*/ plugins
execute pathogen#infect()
Helptags

"" Syntax handling
filetype plugin indent on
syntax enable
colorscheme solarized
set background=dark

 Airline
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
	au!
	au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

