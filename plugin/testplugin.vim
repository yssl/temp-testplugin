"""""""""""""""""""""""""""""""""""""""""""""
" template code
if exists("g:loaded_testplugin") || &cp
  finish
endif
let g:loaded_testplugin	= 1
let s:keepcpo           = &cpo
set cpo&vim
 
"""""""""""""""""""""""""""""""""""""""""""""
" my code
function s:print_hello()
	"echo 'hello'
	echo 'print'
endfunction
command! TestHello call s:print_hello()

"""""""""""""""""""""""""""""""""""""""""""""
" template code
let &cpo= s:keepcpo
unlet s:keepcpo
