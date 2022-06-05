nnoremap <silent> <Leader>dd <cmd>call vimspector#Launch()<CR>

nnoremap <silent> <Leader>dj <cmd>call vimspector#StepInto()<CR>
nnoremap <silent> <Leader>dk <cmd>call vimspector#StepOut()<CR>
nnoremap <silent> <Leader>dl <cmd>call vimspector#StepOver()<CR>
nnoremap <silent> <Leader>d<SPACE> <cmd>call vimspector#Continue()<CR>

nnoremap <silent> <Leader>dp <cmd>call vimspector#Pause()<CR>
nnoremap <silent> <Leader>ds <cmd>call vimspector#Stop()<CR>
nnoremap <silent> <Leader>de <cmd>call vimspector#Reset()<CR>

nnoremap <silent> <Leader>db <cmd>call vimspector#ToggleBreakpoint()<CR>
