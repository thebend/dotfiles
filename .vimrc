set nocompatible
set encoding=utf-8 fileencoding=utf-8

" Relative line numbers except current line
set number relativenumber

" Interface
set ruler
set showcmd
set wildmenu wildnode=list:longest,full
set autoread
set showmatch

" Formatting
set list listchars=tab:\»\ ,trail:·
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
set textwidth=80 linebreak
filetype plugin indent on
syntax enable
colorscheme solarized
" set background=dark

" Searching
set hlsearch
set incsearch wrapscan
set ignorecase smartcase

" Plugins
execute pathogen#infect()		" Auto-import ~/.vim/bundle/*/ plugins
Helptags

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme="tomorrow"
set laststatus=2			" Always enable status bar

" Shortcuts
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <CR> o<Esc>			" Insert newline below
nnoremap <Tab> <c-w>l			" Switch to next pane
nnoremap <S-Tab> <c-w>h			" Switch to previous pane

" Close vime ntirely if only NERDTree left
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

