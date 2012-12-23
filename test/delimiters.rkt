#lang racket
(define good-highlight '(a b #\tab))
(define bad-highlight '(a b #[))
(define stuff-here-still-considered-quoted '())
