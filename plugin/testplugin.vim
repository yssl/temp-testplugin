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

""""""""""""""""""""""""""""""""""""""""""""""
" test print functions
"""""""""""""""""""""""""""""""""""""""""""""
function! PrintCurrentWindow()
	let winnr = winnr()
	let bufnr = winbufnr(winnr)
	let bufname = bufname(bufnr)
	let buftype = getbufvar(bufnr, '&buftype')
	echo 'winnr: '.winnr
	echo 'bufnr: '.bufnr
	echo 'bufname: '.bufname
	echo 'buftype: '.buftype
endfunction

function! PrintWindows()
	for i in range(1, winnr('$'))
		echo 'bufname(winbufnr(i_winnr)): '.bufname(winbufnr(i))
	endfor
endfunction

function! PyPrintWindows()
python << EOF
import vim
for w in vim.windows:
	print 'window.buffer.name:', w.buffer.name
EOF
endfunction

function! PrintBuffers()
	for i in range(1, bufnr('$'))
		echo 'bufname(i_bufnr): '.bufname(i)
	endfor
endfunction

function! PyPrintBuffers()
python << EOF
import vim
for b in vim.buffers:
	print 'buffer.name:', b.name
EOF
endfunction

"""""""""""""""""""""""""""""""""""""""""""""
" template code
let &cpo= s:keepcpo
unlet s:keepcpo
