" Vim syntax file
" Language:     Racket 5.1
" Maintainer:   Will Langstroth <will@langstroth.com>
" URL:          http://github.com/wlangstroth/vim-racket.git
" Last Change:  2011-06-08
" Description:  Contains all of the keywords in #lang racket

" Initializing:
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" Everything that doesn't fit the rules is an error...
syn match racketError ![^ \t()\[\]";]*!
syn match racketError ,[])],

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

" Forms in order of appearance at
" http://docs.racket-lang.org/reference/index.html
"
syn keyword racketSyntax module require provide quote
syn keyword racketSyntax #%datum #%expression #%top #%variable-reference #%app
syn keyword racketSyntax lambda case-lambda let let* letrec
syn keyword racketSyntax let-values let*-values let-syntax letrec-syntax
syn keyword racketSyntax let-syntaxes letrec-syntaxes letrec-syntaxes+values
syn keyword racketSyntax local shared
syn keyword racketSyntax if cond and or case define
syn keyword racketSyntax define define-values define-syntax define-syntaxes
syn keyword racketSyntax define-for-syntax define-require-syntax define-provide-syntax
syn keyword racketSyntax begin begin0 begin-for-syntax
syn keyword racketSyntax when unless
syn keyword racketSyntax set! set!-values
syn keyword racketSyntax for for/list for/vector for/hash for/hasheq for/hasheqv
syn keyword racketSyntax for/and for/or for/lists for/first
syn keyword racketSyntax for/last for/fold
syn keyword racketSyntax for* for*/list for*/vector for*/hash for*/hasheq for*/hasheqv
syn keyword racketSyntax for*/and for*/or for*/lists for*/first
syn keyword racketSyntax for*/last for*/fold
syn keyword racketSyntax for/fold/derived for*/fold/derived
syn keyword racketSyntax define-sequence-syntax :do-in do
syn keyword racketSyntax with-continuation-mark
syn keyword racketSyntax quasiquote unquote unquote-splicing quote-syntax
syn keyword racketSyntax #%top-interaction
syn keyword racketSyntax define-package open-package package-begin
syn keyword racketSyntax define* define*-values define*-syntax define*-syntaxes open*-package
syn keyword racketSyntax package? package-exported-identifiers package-original-identifiers
syn keyword racketSyntax block #%stratified-body

" Functions

syn keyword racketFunc boolean? not equal? eqv? eq? equal?/recur immutable?
syn keyword racketFunc true false symbol=? boolean=? false?
syn keyword racketFunc number? complex? real? rational? integer?
syn keyword racketFunc exact-integer? exact-nonnegative-integer?
syn keyword racketFunc exact-positive-integer? inexact-real?
syn keyword racketFunc fixnum? flonum? zero? positive? negative?
syn keyword racketFunc even? odd? exact? inexact?
syn keyword racketFunc inexact->exact exact->inexact

" 3.2.2 General Arithmetic

" 3.2.2.1 Arithmetic
syn keyword racketFunc + - * / quotient remainder quotient/remainder modulo
syn keyword racketFunc add1 sub1 abs max min gcd lcm round floor ceiling
syn keyword racketFunc truncate numerator denominator rationalize

" 3.2.2.2 Number Comparison
syn keyword racketFunc = < <= > >=

" 3.2.2.3 Powers and Roots
syn keyword racketFunc sqrt integer-sqrt integer-sqrt/remainder
syn keyword racketFunc expt exp log

" 3.2.2.3 Trigonometric Functions
syn keyword racketFunc sin cos tan asin acos atan

" 3.2.2.4 Complex Numbers
syn keyword racketFunc make-rectangular make-polar
syn keyword racketFunc real-part imag-part magnitude angle
syn keyword racketFunc bitwise-ior bitwise-and bitwise-xor bitwise-not
syn keyword racketFunc bitwise-bit-set? bitwise-bit-field arithmetic-shift
syn keyword racketFunc integer-length

" 3.2.2.5 Random Numbers
syn keyword racketFunc random random-seed
syn keyword racketFunc make-pseudo-random-generator pseudo-random-generator?
syn keyword racketFunc current-pseudo-random-generator pseudo-random-generator->vector
syn keyword racketFunc vector->pseudo-random-generator vector->pseudo-random-generator!

" 3.2.2.8 Number-String Conversions
syn keyword racketFunc number->string string->number real->decimal-string
syn keyword racketFunc integer->integer-bytes
syn keyword racketFunc floating-point-bytes->real real->floating-point-bytes
syn keyword racketFunc system-big-endian?

" 3.2.2.9 Extra Constants and Functions
syn keyword racketFunc pi sqr sgn conjugate sinh cosh tanh order-of-magnitude

" 3.2.3 Flonums

" 3.2.3.1 Flonum Arithmetic
syn keyword racketFunc fl+ fl- fl* fl/ flabs
syn keyword racketFunc fl= fl< fl> fl<= fl>= flmin flmax
syn keyword racketFunc flround flfloor flceiling fltruncate
syn keyword racketFunc flsin flcos fltan flasin flacos flatan
syn keyword racketFunc fllog flexp flsqrt
syn keyword racketFunc ->fl fl->exact-integer make-flrectangular
syn keyword racketFunc flreal-part flimag-part

" 3.2.3.2 Flonum Vectors
syn keyword racketFunc flvector? flvector make-flvector flvector-length
syn keyword racketFunc flvector-ref flvector-set! flvector-copy in-flvector
syn keyword racketFunc for/flvector for*/flvector
syn keyword racketFunc shared-flvector make-shared-flvector

" 3.2.4 Fixnums
syn keyword racketFunc fx+ fx- fx* fxquotient fxremainder fxmodulo fxabs
syn keyword racketFunc fxand fxior fxxor fxnot fxlshift fxrshift
syn keyword racketFunc fx= fx< fx> fx<= fx>= fxmin fxmax fx->fl fl->fx

" 3.2.4.2 Fixnum Vectors
syn keyword racketFunc fxvector? fxvector make-fxvector fxvector-length
syn keyword racketFunc fxvector-ref fxvector-set! fxvector-copy in-fxvector
syn keyword racketFunc for/fxvector for*/fxvector
syn keyword racketFunc shared-fxvector make-shared-fxvector

" 3.3 Strings
syn keyword racketFunc string? make-string string string->immutable-string string-length
syn keyword racketFunc string-ref string-set! substring string-copy string-copy!
syn keyword racketFunc string-fill! string-append string->list list->string
syn keyword racketFunc build-string string=? string<? string<=? string>? string>=?
syn keyword racketFunc string-ci=? string-ci<? string-ci<=? string-ci>? string-ci>=?
syn keyword racketFunc string-upcase string-downcase string-titlecase string-foldcase
syn keyword racketFunc string-normalize-nfd string-normalize-nfc string-normalize-nfkc 
syn keyword racketFunc string-locale=? string-locale>? string-locale<?
syn keyword racketFunc string-locale-ci=? string-locale<=?
syn keyword racketFunc string-locale-upcase string-locale-downcase
syn keyword racketFunc string-append* string-join

" 3.4 Bytestrings
syn keyword racketFunc bytes? make-bytes bytes bytes->immutable-bytes byte?
syn keyword racketFunc bytes-length bytes-ref bytes-set! subbytes bytes-copy
syn keyword racketFunc bytes-copy! bytes-fill! bytes-append bytes->list list->bytes
syn keyword racketFunc make-shared-bytes shared-bytes
syn keyword racketFunc bytes=? bytes<? bytes>?
syn keyword racketFunc bytes->string/utf-8 bytes->string/latin-1
syn keyword racketFunc string->bytes/locale string->bytes/latin-1
syn keyword racketFunc string-utf-8-length bytes-utf8-ref bytes-utf-8-index
syn keyword racketFunc bytes-open-converter bytes-close-converter
syn keyword racketFunc bytes-convert bytes-convert-end bytes-converter?
syn keyword racketFunc locale-string-encoding

" 3.5 Characters
syn keyword racketFunc char? char->integer integer->char
syn keyword racketFunc char=? char<? char<=? char>? char>=?
syn keyword racketFunc char-ci=? char-ci<? char-ci<=? char-ci>? char-ci>=?
syn keyword racketFunc char-alphabetic? char-lowercase? char-uppercase? char-title-case?
syn keyword racketFunc char-numeric? char-symbolic? char-punctuation? char-graphic?
syn keyword racketFunc char-whitespace? char-blank?
syn keyword racketFunc char-iso-control? char-general-category
syn keyword racketFunc make-known-char-range-list
syn keyword racketFunc char-upcase char-downcase char-titlecase char-foldcase

" 3.6 Symbols
syn keyword racketFunc symbol? symbol-interned? symbol-unreadable?
syn keyword racketFunc symbol->string string->symbol
syn keyword racketFunc string->uninterned-symbol string->unreadable-symbol
syn keyword racketFunc gensym

" 3.7 Regular Expressions
syn keyword racketFunc regexp? pregexp? byte-regexp? byte-pregexp?
syn keyword racketFunc regexp pregexp byte-regexp byte-pregexp
syn keyword racketFunc regexp-quote regexp-match regexp-match*
syn keyword racketFunc regexp-try-match regexp-match-positions
syn keyword racketFunc regexp-match-positions* regexp-match?
syn keyword racketFunc regexp-match-peek-positions regexp-match-peek-immediate
syn keyword racketFunc regexp-match-peek regexp-match-peek-positions*
syn keyword racketFunc regexp-match/end regexp-match-positions/end
syn keyword racketFunc regexp-match-peek-positions-immediat/end
syn keyword racketFunc regexp-split regexp-replace regexp-replace*
syn keyword racketFunc regexp-replace-quote

" 3.8 Keywords
syn keyword racketFunc keyword? keyword->string string->keyword keyword<?

" 3.9 Pairs and Lists
syn keyword racketFunc pair? null? cons car cdr null
syn keyword racketFunc list? list list* build-list length
syn keyword racketFunc list-ref list-tail append reverse map andmap ormap
syn keyword racketFunc for-each foldl foldr filter remove remq remv remove*
syn keyword racketFunc remq* remv* sort member memv memq memf
syn keyword racketFunc findf assoc assv assq assf
syn keyword racketFunc caar cadr cdar cddr caaar caadr cadar caddr cdaar
syn keyword racketFunc cddar cdddr caaaar caaadr caadar caaddr cadadr caddar
syn keyword racketFunc cadddr cdaaar cdaadr cdadar cddaar cdddar cddddr

" 3.9.7 Additional List Functions and Synonyms
" (require racket/list)
syn keyword racketFunc empty cons? empty? first rest
syn keyword racketFunc second third fourth fifth sixth seventh eighth ninth tenth
syn keyword racketFunc last last-pair make-list take drop split-at
syn keyword racketFunc take-right drop-right split-at-right add-between
syn keyword racketFunc append* flatten remove-duplicates filter-map
syn keyword racketFunc count partition append-map filter-not shuffle
syn keyword racketFunc argmin argmax make-reader-graph placeholder? make-placeholder
syn keyword racketFunc placeholder-set! placeholder-get hash-placeholder?
syn keyword racketFunc make-hash-placeholder make-hasheq-placeholder
syn keyword racketFunc make-hasheqv-placeholder make-immutable-hasheqv

" 3.10 Mutable Pairs and Lists
syn keyword racketFunc mpair? mcons mcar mcdr


syn keyword racketFunc hash? hash-equal? hash-eqv? hash-eq? hash-weak? hash
syn keyword racketFunc hasheq hasheqv
syn keyword racketFunc make-hash make-hasheqv make-hasheq make-weak-hash make-weak-hasheqv
syn keyword racketFunc make-weak-hasheq make-immutable-hash make-immutable-hasheqv
syn keyword racketFunc make-immutable-hasheq
syn keyword racketFunc hash-set! hash-set*! hash-set hash-set* hash-ref hash-ref!
syn keyword racketFunc hash-has-key? hash-update! hash-update hash-remove!
syn keyword racketFunc hash-remove hash-map hash-keys hash-values
syn keyword racketFunc hash->list hash-for-each hash-count
syn keyword racketFunc hash-iterate-first hash-iterate-next hash-iterate-key
syn keyword racketFunc hash-iterate-value hash-copy eq-hash-code eqv-hash-code
syn keyword racketFunc equal-hash-code equal-secondary-hash-code

" ... so that a single + or -, inside a quoted context, would not be
" interpreted as a number (outside such contexts, it's a racketFunc)

syn match racketDelimiter !\.[ \t\[\]()";]!me=e-1
syn match racketDelimiter !\.$!
" ... and a single dot is not a number but a delimiter

syn region racketStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=TOP,racketStruc,racketSyntax,racketFunc
syn region racketStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=TOP,racketStruc,racketSyntax,racketFunc

" Popular Scheme extension:
" using [] as well as ()
syn region racketStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=TOP,racketStruc,racketSyntax,racketFunc
syn region racketStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=TOP,racketStruc,racketSyntax,racketFunc

syn region racketUnquote matchgroup=Delimiter start="," end=![ \t\[\]()";]!me=e-1 contains=TOP,racketStruc,racketSyntax,racketFunc
syn region racketUnquote matchgroup=Delimiter start=",@" end=![ \t\[\]()";]!me=e-1 contains=TOP,racketStruc,racketSyntax,racketFunc

syn region racketUnquote matchgroup=Delimiter start=",(" end=")" contains=TOP
syn region racketUnquote matchgroup=Delimiter start=",@(" end=")" contains=TOP

syn region racketUnquote matchgroup=Delimiter start=",#(" end=")" contains=TOP,racketStruc,racketSyntax,racketFunc
syn region racketUnquote matchgroup=Delimiter start=",@#(" end=")" contains=TOP,racketStruc,racketSyntax,racketFunc

syn region racketUnquote matchgroup=Delimiter start=",\[" end="\]" contains=TOP
syn region racketUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=TOP

syn region racketUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=TOP,racketStruc,racketSyntax,racketFunc
syn region racketUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=TOP,racketStruc,racketSyntax,racketFunc

" This keeps all other stuff unhighlighted, except *stuff* and <stuff>:
syn match racketOther     ,[-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match racketError     ,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@# \t\[\]()";]\+[^ \t\[\]()";]*,

syn match racketOther     "\.\.\."
syn match racketError     !\.\.\.[^ \t\[\]()";]\+!
" ... a special identifier

syn match racketConstant  ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[ \t\[\]()";],me=e-1
syn match racketConstant  ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*$,
syn match racketError     ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match racketConstant  ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1
syn match racketConstant  ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match racketError     ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

" Non-quoted lists, and strings
syn region racketStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=TOP
syn region racketStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=TOP

syn region racketStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=TOP
syn region racketStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=TOP

" Simple literals
syn region racketString start=/\%(\\\)\@<!"/ skip=/\\[\\"]/ end=/"/

syn match racketOther   ![+-][ \t\[\]()";]!me=e-1
syn match racketOther   ![+-]$!

" exact numbers
syn match racketNumberArea          "\<[-+0-9.][-+0-9delfinas#./@]*\>"                contains=racketNotReallyNumber
syn match racketHexNumberArea       /\<\(#x\(#[ei]\)\?\|#[ei]#x\)[^ \t\[\]()";]\+\>/  contains=racketNumQuals,racketHexNumberError
syn match racketDecNumberArea       /\<\(#d\(#[ei]\)\?\|#[ei]#d\)[^ \t\[\]()";]\+\>/  contains=racketNumQuals,racketGeneralNumberError
syn match racketOctNumberArea       /\<\(#o\(#[ei]\)\?\|#[ei]#o\)[^ \t\[\]()";]\+\>/  contains=racketNumQuals,racketGeneralNumberError,racketOctNumberError
syn match racketBinNumberArea       /\<\(#b\(#[ei]\)\?\|#[ei]#b\)[^ \t\[\]()";]\+\>/  contains=racketNumQuals,racketGeneralNumberError,racketBinNumberError

syn match racketHexNumberError      "\([^-+ai]n\|[-+][-+/@#ls]\|/[^0-9a-f]\|[@ls][/#lis@]\|\.[-+.ls]\|#[0-9a-f]\|i[lis/@]\|n[^af.]\|[^-+0-9a-fdlins#./@]\).*"  contained
syn match racketHexNumberError      "[-+lns/@]$"  contained
syn match racketHexNumberError      "[-+][^@sl]*[-+].*[^i]$"  contained
syn match racketHexNumberError      "@.*@"  contained

" racketGeneralNumberError and racketNotReallyNumber are essentially the same,
" modulo the .* matches on the ends- if one occurs in a number area with no
" #[dobx] radix qualifier, then it probably just means the number area isn't
" actually a number area. otherwise, it's an error.
syn match racketGeneralNumberError   "\([-+][-+/@#delfas]\|/[^0-9]\|\.[-+.na]\|#[0-9na]\|i[^n]\|[de@][delfinas/@]\|[ls][delfinas/@#]\|n[^af.]\|f[delfnas#/]\|a[^n]\|[0-9]n\)"   contained
syn match racketNotReallyNumber    ".*\([-+][-+/@#delfas]\|/[^0-9]\|\.[-+.na]\|#[0-9na]\|i[^n]\|[de@][delfinas/@]\|[ls][delfinas/@#]\|n[^af.]\|f[delfnas#/]\|a[^n]\|[0-9]n\).*" contained contains=TOP
syn match racketGeneralNumberError   "[-+delnas/@]$"                            contained
syn match racketNotReallyNumber    ".*[-+delnas/@]$"                            contained contains=TOP
syn match racketGeneralNumberError   "[-+][^@sdlef]*[-+].*[^i]$"                contained
syn match racketNotReallyNumber    ".*[-+][^@sdlef]*[-+].*[^i]$"                contained contains=TOP
syn match racketGeneralNumberError   "[sdle][^-+@]*[sdle]"                      contained
syn match racketNotReallyNumber    ".*[sdle][^-+@]*[sdle].*"                    contained contains=TOP
syn match racketGeneralNumberError   "@.*@"                                     contained
syn match racketNotReallyNumber    ".*@.*@.*"                                   contained contains=TOP
syn match racketGeneralNumberError   "in\([^f]\|f[^.]\|f\.[^0f]\|.\{0,2}$\).*"  contained
syn match racketNotReallyNumber    ".*in\([^f]\|f[^.]\|f\.[^0f]\|.\{0,2}$\).*"  contained contains=TOP
syn match racketGeneralNumberError   "na\([^n]\|n[^.]\|n\.[^0f]\|.\{0,2}$\).*"  contained
syn match racketNotReallyNumber    ".*na\([^n]\|n[^.]\|n\.[^0f]\|.\{0,2}$\).*"  contained contains=TOP
syn match racketGeneralNumberError   "[^-+]\(in\|na\).*"                        contained
syn match racketNotReallyNumber    ".*[^-+]\(in\|na\).*"                        contained contains=TOP
syn match racketGeneralNumberError   "[^i]nf"                                   contained
syn match racketNotReallyNumber    ".*[^i]nf.*"                                 contained contains=TOP
syn match racketNotReallyNumber    "^\.$"                                       contained contains=TOP
syn match racketNotReallyNumber    "^[^-+]*i"                                   contained contains=TOP

syn match racketGeneralNumberError  "[^-+0-9delfinas#./@]"  contained
syn match racketOctNumberError      "[89]"  contained
syn match racketBinNumberError      "[2-9]"  contained

syn match racketNumQuals  /^\(#[eidobx]\)\{1,2}/  contained transparent contains=NONE

" these need to be after racketNumQuals; for some reason, ^ won't work for
" contained matches that follow another contained match. these match the
" whole number string instead of the part after racketNumQuals.
syn match racketHexNumberError       "^\(#[eix]\)*[^-+]*i"  contained
syn match racketGeneralNumberError   "^\(#[eidob]\)[^-+]*i" contained
syn match racketHexNumberError       "^\(#[eix]\)*\.$"      contained
syn match racketGeneralNumberError   "^\(#[eidob]\)*\.$"    contained

syn match racketError   !\(#[xdobei]\)\+\>!

syn match racketBoolean "#[tf]"
syn match racketError   !#[tf][^ \t\[\]()";]\+!

syn match racketChar    "#\\"
syn match racketChar    "#\\."
syn match racketError   !#\\.[^ \t\[\]()";]\+!
syn match racketChar    "#\\space"
syn match racketError   !#\\space[^ \t\[\]()";]\+!
syn match racketChar    "#\\newline"
syn match racketError   !#\\newline[^ \t\[\]()";]\+!
syn match racketChar    "#\\return"
syn match racketError   !#\\return[^ \t\[\]()";]\+!


" Command-line parsing
syn keyword racketExtFunc command-line current-command-line-arguments once-any help-labels multi once-each


syn match racketOther     "##[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

syn match racketSyntax    "#lang "
syn match racketExtSyntax "#:[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

" syntax quoting, unquoting and quasiquotation
syn region racketQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";]!me=e-1 contains=TOP,racketStruc,racketSyntax,racketFunc
syn region racketQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=TOP,racketStruc,racketSyntax,racketFunc
syn region racketQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=TOP,racketStruc,racketSyntax,racketFunc

syn region racketUnquote matchgroup=Delimiter start="#," end=![ \t\[\]()";]!me=e-1 contains=TOP
syn region racketUnquote matchgroup=Delimiter start="#,@" end=![ \t\[\]()";]!me=e-1 contains=TOP
syn region racketUnquote matchgroup=Delimiter start="#,(" end=")" contains=TOP
syn region racketUnquote matchgroup=Delimiter start="#,@(" end=")" contains=TOP
syn region racketUnquote matchgroup=Delimiter start="#,\[" end="\]" contains=TOP
syn region racketUnquote matchgroup=Delimiter start="#,@\[" end="\]" contains=TOP
syn region racketQuoted matchgroup=Delimiter start="#['`]" end=![ \t()\[\]";]!me=e-1 contains=TOP
syn region racketQuoted matchgroup=Delimiter start="#['`](" matchgroup=Delimiter end=")" contains=TOP

" Comments
syn match racketComment /;.*$/
syn region racketMultilineComment start=/#|/ end=/|#/ contains=racketMultilineComment

" Synchronization and the wrapping up...
syn sync match matchPlace grouphere NONE "^[^ \t]"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_racket_syntax_inits")
  if version < 508
    let did_racket_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink racketSyntax             Statement
  HiLink racketFunc               Function

  HiLink racketString             String
  HiLink racketChar               Character
  HiLink racketNumber             Number
  HiLink racketBoolean            Boolean

  HiLink racketNumberArea         Number
  HiLink racketHexNumberArea      Number
  HiLink racketDecNumberArea      Number
  HiLink racketOctNumberArea      Number
  HiLink racketBinNumberArea      Number
  HiLink racketGeneralNumberError Error
  HiLink racketHexNumberError     Error
  HiLink racketOctNumberError     Error
  HiLink racketBinNumberError     Error

  HiLink racketQuoted             Special

  HiLink racketDelimiter          Delimiter
  HiLink racketConstant           Constant

  HiLink racketComment            Comment
  HiLink racketMultilineComment   Comment
  HiLink racketError              Error

  HiLink racketExtSyntax          Type
  HiLink racketExtFunc            PreProc
  delcommand HiLink
endif

let b:current_syntax = "racket"
