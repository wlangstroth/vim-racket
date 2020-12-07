let g:racket_hash_lang_regexp = '^#lang\s\+\([^][)(}{[:space:]]\+\)'
let g:racket_hash_lang_dict = get(g:, 'racket_hash_lang_dict',
      \ {
      \   'racket/base': 'racket',
      \   'typed/racket': 'racket',
      \   'scribble/base': 'scribble',
      \   'scribble/manual': 'scribble',
      \ })

" Tries to detect filetype from #lang line; defaults to ft=racket.
function! RacketDetectHashLang()
  let redo_autocommands = !empty(&filetype)
  let matches = matchlist(getline(1), g:racket_hash_lang_regexp)
  if ! empty(matches)
    execute 'set filetype='.get(g:racket_hash_lang_dict, matches[1], substitute(matches[1], '[/\*?[|<>]', '', 'g'))
  else
    set filetype=racket
  endif
  if redo_autocommands
    if g:syntax_on
      execute 'doautocmd syntaxset FileType' &filetype
    endif
    execute 'doautocmd filetypeplugin FileType' &filetype
    execute 'doautocmd filetypeindent FileType' &filetype
  endif
endfunction

au BufRead,BufNewFile *.rkt,*.rktl call RacketDetectHashLang()
