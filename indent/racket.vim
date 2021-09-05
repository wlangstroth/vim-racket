" Language:     Racket
" Maintainer:   Will Langstroth <will@langstroth.com>
" URL:          http://github.com/wlangstroth/vim-racket

if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setl autoindent lisp nosmartindent

setl lispwords+=module,module*,module+,parameterize,let-values,let*-values,letrec-values,local
setl lispwords+=define-values,opt-lambda,case-lambda,syntax-rules,with-syntax,syntax-case,syntax-parse
setl lispwords+=define-signature,unit,unit/sig,compund-unit/sig,define-values/invoke-unit/sig
setl lispwords+=define-opt/c,define-syntax-rule
setl lispwords+=struct

" Racket OOP
setl lispwords+=class,define/public,define/private

" kanren
setl lispwords+=fresh,run,run*,project,conde,condu

" loops
setl lispwords+=for,for/list,for/fold,for*,for*/list,for*/fold,for/or,for/and
setl lispwords+=for/hash,for/sum,for/flvector,for*/flvector,for/vector

setl lispwords+=match,match*,match/values,define/match,match-lambda,match-lambda*,match-lambda**
setl lispwords+=match-let,match-let*,match-let-values,match-let*-values
setl lispwords+=match-letrec,match-define,match-define-values

let b:undo_indent = "setl ai< si< lisp< lw<"
