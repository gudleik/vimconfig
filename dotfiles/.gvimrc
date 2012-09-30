if has("gui_macvim")
  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  "set guifont=Monaco:h13
  "set guifont=Menlo:h13
  set guifont=DejaVu\ Sans\ Mono:h14
  " set guifont=Bitstream\ Vera\ Sans\ Mono:h16

  set guioptions-=T  " remove toolbar
  set guioptions=egmrt
  set stal=2 " turn on tabs by default
  set noballooneval

  set macmeta

  set fuopt=maxhorz,maxvert
  set anti " Antialias font

  " these are new to vim 7.3: http://groups.google.com/group/vim_announce/browse_thread/thread/66c02efd1523554b
  " set relativenumber
  " set undofile

  set columns=179
  set lines=50

  " Tab headings
  set gtl=%t gtt=%F
endif

" Command-/ to toggle comments
"map <D-/> <plug>NERDCommenterToggle<CR>
"imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
