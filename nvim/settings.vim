" mapleader
let mapleader=' '
" enable reaload
set autoread
" precent creating swapfile and backupfile
set noswapfile
set nobackup
set nowritebackup

" enable incremental seaching 
set incsearch
" dynamic mouse scroll
set scrolloff=5

" -- display --
set number
set title
set ruler
set nolist
set showmatch

" allow mouse
set mouse=a

" indents https://qiita.com/ysn/items/f4fc8f245ba50d5fb8b0
" Use :retab command to switch between tabs and spaces
set noexpandtab
set tabstop=4
"" follows tabstop
set shiftwidth=0
"" follows shiftwidth
set softtabstop=-1
set autoindent
set smartindent
set smarttab
" bind clipboard
set clipboard+=unnamed,unnamedplus
" enable spell checking
set spelllang=en,cjk

function SpellConf()
	redir! => syntax
	silent syntax
	redir END
	
	set spell
	
	if syntax =~? '/<comment\>'
		syntax spell default
		syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent containedin=Comment contained
	else
		syntax spell toplevel
		syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent
	endif
	
	syntax cluster Spell add=SpellNotAscii,SpellMaybeCode
endfunction

augroup spell_check
	autocmd!
	autocmd BufReadPost,BufNewFile,Syntax * call SpellConf()
augroup END
