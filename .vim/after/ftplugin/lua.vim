" u-ctags  -U SCI_NAMESPACE --language-force=C++ -o - --kinds-C++=+p  --extras=+q  /tmp/foo.h
map <F5> <esc>:!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --exclude=.git --exclude=*.js --exclude=*.html --extra=+q .<CR>

" ctags
set tags=./tags,tags
" set tags+=~/.vim/tags/cpp.tags

