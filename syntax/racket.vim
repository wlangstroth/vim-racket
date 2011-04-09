" Vim syntax file
" Language:     Racket 5.1
" Maintainer:   Will Langstroth <will@langstroth.com>
" URL:          http://github.com/wlangstroth/vim-racket.git
" Last Change:  2011-04-08

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

" R5RS Scheme Functions and Syntax:
if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

syn keyword racketSyntax lambda and or if cond case define let let* letrec
syn keyword racketSyntax begin do delay set! else =>
syn keyword racketSyntax quote quasiquote unquote unquote-splicing
syn keyword racketSyntax define-syntax let-syntax letrec-syntax syntax-rules

syn keyword racketFunc not boolean? eq? eqv? equal? pair? cons car cdr set-car!
syn keyword racketFunc set-cdr! caar cadr cdar cddr caaar caadr cadar caddr
syn keyword racketFunc cdaar cdadr cddar cdddr caaaar caaadr caadar caaddr
syn keyword racketFunc cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr
syn keyword racketFunc cddaar cddadr cdddar cddddr null? list? list length
syn keyword racketFunc append reverse list-ref memq memv member assq assv assoc
syn keyword racketFunc symbol? symbol->string string->symbol number? complex?
syn keyword racketFunc real? rational? integer? exact? inexact? = < > <= >=
syn keyword racketFunc zero? positive? negative? odd? even? max min + * - / abs
syn keyword racketFunc quotient remainder modulo gcd lcm numerator denominator
syn keyword racketFunc floor ceiling truncate round rationalize exp log sin cos
syn keyword racketFunc tan asin acos atan sqrt expt make-rectangular make-polar
syn keyword racketFunc real-part imag-part magnitude angle exact->inexact
syn keyword racketFunc inexact->exact number->string string->number char=?
syn keyword racketFunc char-ci=? char<? char-ci<? char>? char-ci>? char<=?
syn keyword racketFunc char-ci<=? char>=? char-ci>=? char-alphabetic? char?
syn keyword racketFunc char-numeric? char-whitespace? char-upper-case?
syn keyword racketFunc char-lower-case?
syn keyword racketFunc char->integer integer->char char-upcase char-downcase
syn keyword racketFunc string? make-string string string-length string-ref
syn keyword racketFunc string-set! string=? string-ci=? string<? string-ci<?
syn keyword racketFunc string>? string-ci>? string<=? string-ci<=? string>=?
syn keyword racketFunc string-ci>=? substring string-append vector? make-vector
syn keyword racketFunc vector vector-length vector-ref vector-set! procedure?
syn keyword racketFunc apply map for-each call-with-current-continuation
syn keyword racketFunc call-with-input-file call-with-output-file input-port?
syn keyword racketFunc output-port? current-input-port current-output-port
syn keyword racketFunc open-input-file open-output-file close-input-port
syn keyword racketFunc close-output-port eof-object? read read-char peek-char
syn keyword racketFunc write display newline write-char call/cc
syn keyword racketFunc list-tail string->list list->string string-copy
syn keyword racketFunc string-fill! vector->list list->vector vector-fill!
syn keyword racketFunc force with-input-from-file with-output-to-file
syn keyword racketFunc char-ready? load transcript-on transcript-off eval
syn keyword racketFunc dynamic-wind port? values call-with-values
syn keyword racketFunc racket-report-environment null-environment
syn keyword racketFunc interaction-environment

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

" Modules require stmt
syn keyword racketExtSyntax module require dynamic-require lib prefix all-except prefix-all-except rename

" modules provide stmt
syn keyword racketExtSyntax provide struct all-from all-from-except all-defined all-defined-except

" Other from MzScheme
syn keyword racketExtSyntax with-handlers when unless instantiate define-struct case-lambda syntax-case
syn keyword racketExtSyntax free-identifier=? bound-identifier=? module-identifier=? syntax-object->datum
syn keyword racketExtSyntax datum->syntax-object
syn keyword racketExtSyntax let-values let*-values letrec-values set!-values fluid-let parameterize begin0
syn keyword racketExtSyntax error raise opt-lambda define-values unit unit/sig define-signature 
syn keyword racketExtSyntax invoke-unit/sig define-values/invoke-unit/sig compound-unit/sig import export
syn keyword racketExtSyntax link syntax quasisyntax unsyntax with-syntax

syn keyword racketExtFunc format system-type current-extension-compiler current-extension-linker
syn keyword racketExtFunc use-standard-linker use-standard-compiler
syn keyword racketExtFunc find-executable-path append-object-suffix append-extension-suffix
syn keyword racketExtFunc current-library-collection-paths current-extension-compiler-flags make-parameter
syn keyword racketExtFunc current-directory build-path normalize-path current-extension-linker-flags
syn keyword racketExtFunc file-exists? directory-exists? delete-directory/files delete-directory delete-file
syn keyword racketExtFunc system compile-file system-library-subpath getenv putenv current-standard-link-libraries
syn keyword racketExtFunc remove* file-size find-files fold-files directory-list shell-execute split-path
syn keyword racketExtFunc current-error-port process/ports process printf fprintf open-input-string open-output-string
syn keyword racketExtFunc get-output-string

" exceptions
syn keyword racketExtFunc exn exn:application:arity exn:application:continuation exn:application:fprintf:mismatch
syn keyword racketExtFunc exn:application:mismatch exn:application:type exn:application:mismatch exn:break exn:i/o:filesystem exn:i/o:port
syn keyword racketExtFunc exn:i/o:port:closed exn:i/o:tcp exn:i/o:udp exn:misc exn:misc:application exn:misc:unsupported exn:module exn:read
syn keyword racketExtFunc exn:read:non-char exn:special-comment exn:syntax exn:thread exn:user exn:variable exn:application:mismatch
syn keyword racketExtFunc exn? exn:application:arity? exn:application:continuation? exn:application:fprintf:mismatch? exn:application:mismatch?
syn keyword racketExtFunc exn:application:type? exn:application:mismatch? exn:break? exn:i/o:filesystem? exn:i/o:port? exn:i/o:port:closed?
syn keyword racketExtFunc exn:i/o:tcp? exn:i/o:udp? exn:misc? exn:misc:application? exn:misc:unsupported? exn:module? exn:read? exn:read:non-char?
syn keyword racketExtFunc exn:special-comment? exn:syntax? exn:thread? exn:user? exn:variable? exn:application:mismatch?

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
