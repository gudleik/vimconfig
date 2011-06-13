" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                              GUI stuff                                    |
" -----------------------------------------------------------------------------  


" OS Specific *****************************************************************
if has("gui_macvim")

  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  "set guifont=Monaco:h13
  "set guifont=Menlo:h13
  "set guifont=DejaVu\ Sans\ Mono:h14
  set guifont=Bitstream\ Vera\ Sans\ Mono:h16
  set guioptions-=T  " remove toolbar
  set stal=2 " turn on tabs by default

elseif has("gui_gtk2")

  set guifont=Monaco
  set guioptions-=T  " remove toolbar

elseif has("x11")
elseif has("gui_win32")
end


if has("gui_running")
  set guioptions=egmrt
  " colorscheme wombat
  " colorscheme mac_classic
  " colorscheme ir_black
  set background=light
  colorscheme solarized
  set fuopt=maxhorz,maxvert
  syntax on

  " these are new to vim 7.3: http://groups.google.com/group/vim_announce/browse_thread/thread/66c02efd1523554b
  " set relativenumber
  " set undofile
endif


" General *********************************************************************
set anti " Antialias font

"set transparency=0

" Default size of window
set columns=179 
set lines=50

" Tab headings 
set gtl=%t gtt=%F
