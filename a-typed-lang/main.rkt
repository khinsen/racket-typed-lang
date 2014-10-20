#lang typed-racket/minimal

(require typed/racket
         a-typed-lang/more
         (only-in typed/racket
                  [#%module-begin tr:module-begin]
                  [require tr:require]))

(provide (except-out (all-from-out typed/racket) #%module-begin)
         (rename-out [module-begin #%module-begin])
         (all-from-out a-typed-lang/more))

(define-syntax module-begin
  (syntax-rules (require)
    [(_ decl ...)
     (tr:module-begin
      (require a-typed-lang/more)
      decl ...)]))
