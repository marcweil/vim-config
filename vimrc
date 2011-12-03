set nocompatible        " We're running Vim, not Vi!
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'taglist.vim'
Bundle 'surround.vim'
Bundle 'L9'
Bundle 'othree/xml.vim'
Bundle 'othree/html5.vim'

filetype on             " Enable filetype detection
syntax on               " Enable syntax highlighting
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins
set smarttab
set ic sc
set history=1000        " Number of things to remember in history. 
set autowrite           " Writes on make/shell commands
set t_Co=256            " 256bit color
set hidden
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set wildmode=list:longest
set ruler
set autoindent
set nowrap
set nu
set ruler
set go+=b               " Enable horizonal scrollbar.
let mapleader = ","
set guifont=Anonymous\ Pro:h13
set switchbuf=useopen
set hlsearch

" Folding stuff
hi Folded guibg=red guifg=Red cterm=bold ctermbg=DarkGrey ctermfg=lightblue
hi FoldColumn guibg=grey78 gui=Bold guifg=DarkBlue
set foldclose=
set foldmethod=syntax
set foldnestmax=10
set foldlevel=9999
set fillchars=vert:\|,fold:\
set foldminlines=1

" Map this function to Space key.
noremap <space> :call ToggleFold()<CR>
fu! ToggleFold()
   if foldlevel('.') == 0
       normal! l
   else
       if foldclosed('.') < 0
           . foldclose
       else
           . foldopen
       endif
   endif
   echo
endf

colorscheme vividchalk

au BufRead,BufNewFile *.rabl setf ruby " Add RABL (ruby gem) syntax support (maps to ruby)

highlight clear Search
highlight Search term=reverse cterm=bold ctermbg=4 guifg=white guibg=hotpink1

map // <Esc>:noh<CR>
map <F2> <Esc>:NERDTreeToggle<CR>
map <C-F2> <Esc>:NERDTreeFind<CR>
map <F2><F2> <Esc>:NERDTree 
map <C-t>n <Esc>:tabnew<CR>
map <C-t>c <Esc>:tabclose<CR>
map <C-t><C-l> <Esc>:TlistToggle<CR>
imap <D-/> <C-x><C-n>
map <C-W><C-V> <Esc>:vnew<CR>
nnoremap <F4> :buffers<CR>:buffer<space>
imap ,/ </<C-X><C-O>
nnoremap ' `
nnoremap ` '

" PHP Folding
map <F6> <Esc>:DisablePHPFolds<Cr> 
map <F7> <Esc>:EnableFastPHPFolds<Cr> 
map <S-F7> <Esc>:EnablePHPFolds<Cr> 

" FuzzyFile mappings
map <C-f><C-f> :FufFile<CR>
map <C-f><C-d> :FufDir<CR>
map <C-f><C-t> :FufTag<CR>
map <C-f><C-b> :FufBuffer<CR>
map <C-f><C-l> :FufLine<CR>

" F5 Toggle spell check 
map <F5> <Esc>:setlocal spell spelllang=en_us<CR>
map <S-F5> <Esc>:setlocal nospell<CR>

