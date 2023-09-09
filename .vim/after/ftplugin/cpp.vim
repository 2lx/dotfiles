autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=111

" toggle .cpp / .h files
map <F12> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
