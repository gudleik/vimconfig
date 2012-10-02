au BufWritePost *.coffee silent CoffeeMake! -b -o /tmp | cwindow | redraw!

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
