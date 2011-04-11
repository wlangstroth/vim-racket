" Vim syntax file
" Language:     Racket 5.1
" Maintainer:   Will Langstroth <will@langstroth.com>
" URL:          http://github.com/wlangstroth/vim-racket.git
" Last Change:  2011-04-10
" Description:  Contains all of the keywords in #lang racket

" Initializing:
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" Everything that doesn't fit the rules is an error...
syn match racketError oneline    ![^ \t()\[\]";]*!
syn match racketError oneline    ")"

" Quoted and backquoted stuff
syn region racketQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";]!me=e-1 contains=ALLBUT,racketStruc,racketSyntax,racketFunc

syn region racketQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALLBUT,racketStruc,racketSyntax,racketFunc
syn region racketQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=ALLBUT,racketStruc,racketSyntax,racketFunc

syn region racketStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,racketStruc,racketSyntax,racketFunc
syn region racketStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,racketStruc,racketSyntax,racketFunc

" Popular Scheme extension:
" using [] as well as ()
syn region racketStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,racketStruc,racketSyntax,racketFunc
syn region racketStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,racketStruc,racketSyntax,racketFunc

syn region racketUnquote matchgroup=Delimiter start="," end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,racketStruc,racketSyntax,racketFunc
syn region racketUnquote matchgroup=Delimiter start=",@" end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,racketStruc,racketSyntax,racketFunc

syn region racketUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region racketUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

syn region racketUnquote matchgroup=Delimiter start=",#(" end=")" contains=ALLBUT,racketStruc,racketSyntax,racketFunc
syn region racketUnquote matchgroup=Delimiter start=",@#(" end=")" contains=ALLBUT,racketStruc,racketSyntax,racketFunc

syn region racketUnquote matchgroup=Delimiter start=",\[" end="\]" contains=ALL
syn region racketUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=ALL

syn region racketUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=ALLBUT,racketStruc,racketSyntax,racketFunc
syn region racketUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=ALLBUT,racketStruc,racketSyntax,racketFunc

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


syn keyword racketFunc regexp pregexp regexp-replace

syn keyword racketFunc substring string-length


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

syn match racketDelimiter oneline !\.[ \t\[\]()";]!me=e-1
syn match racketDelimiter oneline !\.$!
" ... and a single dot is not a number but a delimiter

" This keeps all other stuff unhighlighted, except *stuff* and <stuff>:

syn match racketOther     oneline ,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match racketError     oneline ,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match racketOther     oneline "\.\.\."
syn match racketError     oneline !\.\.\.[^ \t\[\]()";]\+!
" ... a special identifier

syn match racketConstant  oneline ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[ \t\[\]()";],me=e-1
syn match racketConstant  oneline ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*$,
syn match racketError     oneline ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match racketConstant  oneline ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1
syn match racketConstant  oneline ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match racketError     oneline ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

" Non-quoted lists, and strings:
syn region racketStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region racketStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL

syn region racketStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL
syn region racketStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

" Simple literals:
syn region racketString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+

" Comments:
syn match racketComment ";.*$"

syn match racketOther   oneline  ![+-][ \t\[\]()";]!me=e-1
syn match racketOther   oneline  ![+-]$!

syn match racketNumber  oneline  "[-#+0-9.][-#+/0-9a-f@i.boxesfdl]*"
syn match racketError   oneline  ![-#+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*!

syn match racketBoolean oneline  "#[tf]"
syn match racketError   oneline  !#[tf][^ \t\[\]()";]\+!

syn match racketChar    oneline  "#\\"
syn match racketChar    oneline  "#\\."
syn match racketError   oneline  !#\\.[^ \t\[\]()";]\+!
syn match racketChar    oneline  "#\\space"
syn match racketError   oneline  !#\\space[^ \t\[\]()";]\+!
syn match racketChar    oneline  "#\\newline"
syn match racketError   oneline  !#\\newline[^ \t\[\]()";]\+!

" MzScheme extensions
" multiline comment
syn region racketComment start="#|" end="|#"

" #%xxx are the special MzScheme identifiers
syn match racketOther   oneline "#%[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

" anything limited by |'s is identifier
syn match racketOther   oneline "|[^|]\+|"
syn match racketChar    oneline "#\\\%(return\|tab\)"

" Command-line parsing
syn keyword racketExtFunc command-line current-command-line-arguments once-any help-labels multi once-each 

" syntax quoting, unquoting and quasiquotation
syn region racketUnquote matchgroup=Delimiter start="#," end=![ \t\[\]()";]!me=e-1 contains=ALL
syn region racketUnquote matchgroup=Delimiter start="#,@" end=![ \t\[\]()";]!me=e-1 contains=ALL
syn region racketUnquote matchgroup=Delimiter start="#,(" end=")" contains=ALL
syn region racketUnquote matchgroup=Delimiter start="#,@(" end=")" contains=ALL
syn region racketUnquote matchgroup=Delimiter start="#,\[" end="\]" contains=ALL
syn region racketUnquote matchgroup=Delimiter start="#,@\[" end="\]" contains=ALL
syn region racketQuoted matchgroup=Delimiter start="#['`]" end=![ \t()\[\]";]!me=e-1 contains=ALL
syn region racketQuoted matchgroup=Delimiter start="#['`](" matchgroup=Delimiter end=")" contains=ALL

" multiline comment
syntax region racketMultilineComment start=/#|/ end=/|#/ contains=racketMultilineComment

syn match racketOther     oneline "##[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

syn match racketExtSyntax oneline "#lang "
syn match racketExtSyntax oneline "#:[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

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
