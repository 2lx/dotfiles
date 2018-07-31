map <F5> <esc>:!ctags -R --sort=yes --fields=+iaS --languages=python --exclude=.git --extra=+q .<CR>

autocmd BufWritePost * call system("ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --exclude=.git --extra=+q .")

" ctags
set tags=./tags,tags
" set tags+=~/.vim/tags/cpp.tags

map <F7> :make<CR><CR>
