"""""""""""""""""""""""""""""""""""""""""""""
" template code
" Exit when your app has already been loaded (or "compatible" mode set)
if exists("g:loaded_testplugin") || &cp
  finish
endif
let g:loaded_testplugin	= 1
let s:keepcpo           = &cpo
set cpo&vim
 
"""""""""""""""""""""""""""""""""""""""""""""
" my code
function! s:print_hello()
	echo 'hello1'
	"echo 'hello2'
endfunction
command! TestpluginHello call s:print_hello()

"""""""""""""""""""""""""""""""""""""""""""""
" template code
let &cpo= s:keepcpo
unlet s:keepcpo
