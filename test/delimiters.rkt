#lang racket
(define good-highlight '(a b #tab))
(define bad-highlight1 '(a b #[))
(define bad-highlight2 '(a b #\tab))
(define stuff-here-should-not-be-quoted '())
