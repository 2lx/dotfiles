autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=121

"command -nargs=* Cargo cex system("cargo <args>")
" compiler rustc
" setlocal makeprg=cargo build

map <F5> <esc>:!$HOME/.cargo/bin/rusty-tags vi<CR><CR>

setlocal tags=./rusty-tags.vi;/
map <F6> :make run<CR><CR>
map <F7> :make test<CR><CR>
map <F9> :RustFmt<CR>

" Open Quickfix window automatically after running :make
augroup OpenQuickfixWindowAfterMake
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
augroup END
