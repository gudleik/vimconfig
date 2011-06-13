" VIM configuration
"
filetype off
silent! call pathogen#runtime_append_all_bundles()

colorscheme ir_black

set background=dark
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set syntax=automatic

" Searching
set hlsearch          " highlight search
set incsearch         " search as you type
set ignorecase        " ignore case when searching
set smartcase         " ignore case when searching lowercase
set showmatch
set gdefault          " always assume /g when replacing
set showmode

set modelines=0       "
set encoding=utf-8

set nowrap            " don't wrap long lines
set linebreak         " wrap at word
set ch=2              " make command line two lines

set backspace=indent,eol,start " make backspace a more flexible
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/tmp

set foldmethod=syntax

set laststatus=2 " always show the status line
if has("mac")
  silent! set nomacatsui
else
  set lazyredraw
end
set linespace=0 " don't insert any extra pixel lines betweens rows
set nolist " show tabs and trailing spaces
"set listchars=tab:>-,trail:- " show tabs and trailing spaces
set listchars=tab:▸\ ,eol:¬
set scrolloff=3 " Keep 4 lines (top/bottom) for scope
set ruler
set splitbelow
set splitright
set cursorline


set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%{exists('*rails#statusline')?rails#statusline():''}%{exists('*fugitive#statusline')?fugitive#statusline():''}%#ErrorMsg#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*%=%-16(\ %l,%c-%v\ %)%P
set statusline+=%{rvm#statusline()}

set tags+=../tags,../../tags,../../../tags,../../../../tags,tmp/tags
set visualbell
set nu
set grepprg=ack " FTW

augroup RUBY
  autocmd!
  autocmd BufNewFile,BufRead */spec/**/*.rb,*_spec.rb compiler rspec
  autocmd BufNewFile,BufRead */test/**/*.rb,*_test.rb compiler rubyunit
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  " next line causes macvim to crash :(
  " autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
augroup END

au BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec

autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

" Plugins

let Tlist_Use_Right_Window=1
nnoremap <silent> <F8> :TlistToggle<CR>

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" Maps

let mapleader = ","

nmap <silent> <Leader>p :CommandT<CR>
map <silent> <Leader>r :!ctags --extra=+f -R *<CR><CR>
map <Leader>s :Rake<CR>
" map <Leader>c :.Rake<CR>
map <Leader>c <plug>NERDCommenterToggle
" noremap <Leader> :Vex<CR>ERDTree
map <silent> <Leader>n :NERDTreeToggle<CR>


" Command-T
set wildignore+=*.o,*.obj,.git,tmp/sass-cache
" Cmd-R: Reload commandT
map <D-r> :CommandTFlush<CR>
" Leader p: CommandT
nmap <silent> <Leader>p :CommandT<CR>

" CRTL-L: Redraw screen and hide highlighted search (nohlsearch)
nnoremap <silent> <C-l> :nohl<CR><C-l>

" allow a more natural style of line editing in :ex mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

noremap <C-A> <Home>
noremap <C-E> <End>
map! <C-A> <Home>
map! <C-E> <End>

nnoremap <Leader>a :Ack
nnoremap <Leader><space> :noh<cr>    " clear highlighted search with leader-space
nnoremap <Leader>i :set list!<CR> " Toggle invisible chars
nnoremap <Leader>v V`]  " select pasted text with leader-v
inoremap jj <ESC>       " espape insert mode with jj

" Switch tab with cmd-n
" in command mode
map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

" insert mode
map! <D-1> <C-O>:tabn 1<CR>
map! <D-2> <C-O>:tabn 2<CR>
map! <D-3> <C-O>:tabn 3<CR>
map! <D-4> <C-O>:tabn 4<CR>
map! <D-5> <C-O>:tabn 5<CR>
map! <D-6> <C-O>:tabn 6<CR>
map! <D-7> <C-O>:tabn 7<CR>
map! <D-8> <C-O>:tabn 8<CR>
map! <D-9> <C-O>:tabn 9<CR


" Makegreen
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Tabularize
nmap <Leader>]= :Tabularize /=<CR>
vmap <Leader>]= :Tabularize /=<CR>
nmap <Leader>]: :Tabularize /:\zs<CR>
vmap <Leader>]: :Tabularize /:\zs<CR>

" Auto tabularize when entering |
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

map   <silent> <F5> mmgg=G`m^
imap  <silent> <F5> <Esc> mmgg=G`m^
