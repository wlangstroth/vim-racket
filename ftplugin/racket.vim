" Language:     Racket
" Maintainer:   Will Langstroth <will@langstroth.com>
" URL:          http://github.com/wlangstroth/vim-racket
" Last Change:  2011-04-12

setl iskeyword+=#,%,^
setl lispwords+=module,parameterize,let-values,let*-values,letrec-values
setl lispwords+=define-values,opt-lambda,case-lambda,syntax-rules,with-syntax,syntax-case
setl lispwords+=define-signature,unit,unit/sig,compund-unit/sig,define-values/invoke-unit/sig
" match
setl lispwords+=match,match*

" kanren
setl lispwords+=fresh,run,run*,project

" loops
setl lispwords+=for,for/list,for/fold,for*,for*/list,for*/fold,for/or
setl lisp
