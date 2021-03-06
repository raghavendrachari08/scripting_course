" Vim version 7.4, some mappings work in gvim only

" ----- General Settings -----
" history limit
set history=100
" Don't create backup files
set nobackup
" Don't create swap files
set noswapfile
" Dark theme
colorscheme murphy
" show partial Normal mode command as they are typed on Command Line
" show character/line/block selection in Visual mode on Command Line
set showcmd

" first tab hit will complete as much as possible
" second tab hit will provide a list
" third and subsequent tabs will cycle through
set wildmode=longest,list,full

" ----- Text and Indent Settings -----
" No textwidth limit
set textwidth=0
" general indent setting
set autoindent
" use file type based Indent setting
filetype plugin indent on
" number of characters to indent by
set shiftwidth=4
" No. of characters for Tab key
set tabstop=4
" Set Tab character to expand as spaces
set expandtab
" highlight current line
set cursorline
" add <> to % matchpairs 
set matchpairs+=<:>
" :h matchit-install for instructions on installing plugin to match keywords with %

" ----- Search Settings -----
" start searching as it is typed
set incsearch
" Highlight search patterns
set hlsearch
" search visually selected text
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>
" always use magic mode
nnoremap / /\v
nnoremap ? ?\v
" clear highlighted search text until next explicit search or n/N
" <silent> - so as to not print :noh on last line when pressing space
nnoremap <silent> <Space> :noh<CR><Space>

" ----- Custom Mappings -----
" Map F2 key to save file in command mode
nnoremap #2 :w<CR>
" Map F2 key to save file in insert mode
inoremap <F2> <Esc>:w<CR>a
" Map F3 key to save and quit file in command mode
nnoremap #3 :wq<CR>
" Map F4 key to clear file contents in command mode
nnoremap #4 ggdG
" Map F5 key to copy entire contents of file to clipboard
nnoremap #5 gg"+yG

" Map F2 key to save file in insert mode
inoremap <F2> <C-o>:w<CR>
" Ctrl+e to move to end of word
inoremap <C-e> <Esc>ea
" Ctrl+b to move to beginning of word
inoremap <C-b> <C-o>b
" Ctrl+a to move to end of line
inoremap <C-a> <C-o>A
" Can't use Ctrl+i remapping as it affects Tab as well
inoremap <C-s> <C-o>I

" ----- Change/Modify default Mappings -----
" change Y to behave similar to D and C
nnoremap Y y$
" Ctrl+v to paste from clipboard in insert mode
" Ctrl+q can be used to insert special characters
inoremap <C-v> <C-o>"+p
" Ctrl+l to autocomplete sentences
inoremap <C-l> <C-x><C-l>

" ----- Abbreviations -----
" Expand p as below when it is used as a word
" #!/usr/bin/perl
" use strict;
" use warnings;
inoreabbrev p #!/usr/bin/perl<CR>use strict;<CR>use warnings;<CR>
" py2 for python
inoreabbrev py2 #!/usr/bin/python
" py for python3
inoreabbrev py #!/usr/bin/python3
" auto correct teh as the
inoreabbrev teh the

" set a grayish ColorColumn
highlight ColorColumn ctermbg=0 guibg=#121212

" ----- autocmd -----
augroup plpysh
    autocmd!

    " automatically add Perl path using previously set inoreabbrev for p
    autocmd BufNewFile *.pl :normal ip
    " automatically add Python path
    autocmd BufNewFile *.py :normal ipy
    
    " show column guideline at 80th character
    autocmd FileType perl,python,sh :set colorcolumn=80
 
    " Prevent comment character leaking to next line
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o
augroup END

" ----- Useful Verilog Settings -----
" completion for verilog control structures
" type @a/@i/@e/@I in insert mode and press Esc key
inoreabbrev @a always @()<CR>begin<CR>end<Esc>2k$
inoreabbrev @i if ()<CR>begin<CR>end<Esc>2k$
inoreabbrev @e else ()<CR>begin<CR>end<Esc>2k$
inoreabbrev @I if ()<CR>begin<CR>end<CR>else<CR>begin<CR>end<Esc>5k$

" Allows to use gf on module names
set suffixesadd+=.v,.V,.sv,.SV
" Useful for opening modules from different hierarchies
"set path+=/path1/,/path2/,etc

" no menubar or Toolbar
set guioptions-=m
set guioptions-=T


" Other useful vimrcs and links
" https://github.com/vim/vim/blob/master/runtime/defaults.vim
" https://github.com/romainl/idiomatic-vimrc/blob/master/idiomatic-vimrc.vim
" https://vi.stackexchange.com/questions/2003/how-do-i-debug-my-vimrc-file
