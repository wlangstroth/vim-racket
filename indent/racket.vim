" Vim indent file
" Language:     Racket 5.1
" Maintainer:   Will Langstroth <will@langstroth.com>
" URL:          http://langstroth.com/vim
" Last Change:  2011-04-08

if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal ai nosi

let b:undo_indent = "setl ai< si<"
