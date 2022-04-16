set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set undodir=$HOME/.nvim/undo/    " make sure to create this directory
