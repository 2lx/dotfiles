set noautoindent
set nosmartindent
set indentexpr=

set tabstop=2                   " Number of spaces that a <Tab> in the file counts for
set softtabstop=2               " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
set shiftwidth=2                " Used with indent commands like >> and <<

autocmd FileType cpp autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=101
