let mapleader = " "

nnoremap <silent> <leader>r editor.action.rename
nnoremap <silent> K editor.action.showHover
nnoremap <silent> <C-b> workbench.view.explorer

nnoremap <silent> <leader>d<space> workbench.action.debug.continue
nnoremap <silent> <leader>d<space> workbench.action.debug.pause

nnoremap <silent> <leader>dj workbench.action.debug.stepInto
nnoremap <silent> <leader>dk workbench.action.debug.stepOut
nnoremap <silent> <leader>dl workbench.action.debug.stepOver
nnoremap <silent> <leader>de workbench.action.debug.stop
nnoremap <silent> <leader>db editor.debug.action.toggleBeakpoint