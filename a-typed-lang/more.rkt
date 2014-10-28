#lang typed/racket

(provide foo fooify)

; A function
(: foo (-> Integer Integer))
(define (foo x)
  (* 2 x))

; A syntax transformer (aka macro)
(define-syntax-rule (fooify id)
  (set! id (foo id)))
