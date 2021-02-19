" hightlight 101st column
autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=101
highlight Error NONE

" ctags
set tags=./tags,tags

" u-ctags  -U SCI_NAMESPACE --language-force=C++ -o - --kinds-C++=+p  --extras=+q  /tmp/foo.h
map <F5> <esc>:!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --languages=lua --extra=+q .<CR>

map <F9> :LuaFormat<CR>
setlocal iskeyword+=:
setlocal iskeyword+=.
