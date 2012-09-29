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
  set noballooneval

  set macmeta

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
  " colorscheme solarized
  set background=light
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

" Command-/ to toggle comments
"map <D-/> <plug>NERDCommenterToggle<CR>
"imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Command-][ to increase/decrease indentation
vmap <D-]> >gv
vmap <D-[> <gv

" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
" ------------------------------------------------------------------
" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_visibility="normal"    "default value is normal
syntax enable
set background=light
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=16
" let g:solarized_contrast="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1

if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
