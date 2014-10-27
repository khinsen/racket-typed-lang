#lang a-typed-lang

(: x Integer)
(define x 42)

(displayln x)

(displayln (foo x))

; Verify that we are really using the original function foo,
; rather than a version wrapped with a runtime contract check.
(displayln (impersonator? foo))
