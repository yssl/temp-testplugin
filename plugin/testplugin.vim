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
	echo 'winnr() '.winnr()
	echo 'bufwinnr("%") '.bufwinnr('%')
	echo 'bufnr: '.bufnr
	echo 'bufnr("%") '.bufnr('%')
	echo 'winbufnr("%") '.winbufnr('%')
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

" from http://vim.wikia.com/wiki/User_input_from_a_script
function! Demo()
  let curline = getline('.')
  call inputsave()
  let name = input('Enter name: ')
  call inputrestore()
  call setline('.', curline . ' ' . name)
endfunction

function! DefPython()
python << PYEND
import vim
def python_input(message = 'input'):
  vim.command('call inputsave()')
  vim.command("let user_input = input('" + message + ": ')")
  vim.command('call inputrestore()')
  return vim.eval('user_input')

def demo():
  curline = vim.current.line
  name = python_input('Enter name')
  vim.current.line = curline + ' ' + name
PYEND
endfunction
call DefPython()

"""""""""""""""""""""""""""""""""""""""""""""
" template code
let &cpo= s:keepcpo
unlet s:keepcpo
