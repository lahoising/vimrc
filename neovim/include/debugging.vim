nnoremap <silent> <Leader>dd :call vimspector#Launch()<CR>

nnoremap <silent> <Leader>dj :call vimspector#StepInto()<CR>
nnoremap <silent> <Leader>dk :call vimspector#StepOut()<CR>
nnoremap <silent> <Leader>dl :call vimspector#StepOver()<CR>
nnoremap <silent> <Leader>d<SPACE> :call vimspector#Continue()<CR>

nnoremap <silent> <Leader>dp :call vimspector#Pause()<CR>
nnoremap <silent> <Leader>ds :call vimspector#Stop()<CR>
nnoremap <silent> <Leader>de :call vimspector#Reset()<CR>

nnoremap <silent> <Leader>db :call vimspector#ToggleBreakpoint()<CR>
