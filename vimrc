set nocompatible        " We're running Vim, not Vi!
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails'
Plugin 'FuzzyFinder'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'taglist.vim'
Plugin 'surround.vim'
Plugin 'L9'
Plugin 'othree/xml.vim'
Plugin 'othree/html5.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/vim-handlebars'
Plugin 'groenewege/vim-less'
Plugin 'lepture/vim-css'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'hashivim/vim-terraform'

call vundle#end()
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins

filetype on             " Enable filetype detection
syntax on               " Enable syntax highlighting

set smartcase
set smarttab
set ic sc
set history=1000        " Number of things to remember in history. 
set autowrite           " Writes on make/shell commands
set t_Co=256            " 256bit color
set hidden
set expandtab
set wildmode=list:longest
set ruler
set autoindent
set nowrap
set nu
set ruler
set go+=b               " Enable horizonal scrollbar.
let mapleader = ","
let g:EasyMotion_leader_key = '<Leader>'
set guifont=Anonymous\ Pro:h13
set switchbuf=useopen
set hlsearch
set backspace=2

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

fu! StripWhitespace()
    :%s/\s\+$//e
endf

colorscheme vividchalk

au BufRead,BufNewFile *.rabl set filetype=ruby
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent shiftwidth=2 expandtab
au BufNewFile,BufRead *.raml set filetype=yaml
au FileType * set tabstop=4|set shiftwidth=4
au FileType ruby set tabstop=2|set shiftwidth=2
au FileType javascript set tabstop=2|set shiftwidth=2
au FileType yaml set tabstop=2|set shiftwidth=2

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

