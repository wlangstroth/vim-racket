#lang at-exp racket

(define (bar)
  "BAR")

(define (foo)
  (displayln @~a{Foo is a @(bar)}))

(foo)
