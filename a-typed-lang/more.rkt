#lang typed/racket

(provide foo)

(: foo (-> Integer Integer))
(define (foo x)
  (* 2 x))
