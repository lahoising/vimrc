nnoremap <Leader>dd :call vimspector#Launch()<CR>

nnoremap <Leader>dj :call vimspector#StepInto()<CR>
nnoremap <Leader>dk :call vimspector#StepOut()<CR>
nnoremap <Leader>dl :call vimspector#StepOver()<CR>
nnoremap <Leader>d<SPACE> :call vimspector#Continue()<CR>

nnoremap <Leader>dp :call vimspector#Pause()<CR>
nnoremap <Leader>ds :call vimspector#Stop()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>

nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
