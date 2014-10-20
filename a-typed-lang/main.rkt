#lang typed-racket/minimal

(require typed/racket
         ;a-typed-lang/more ; for some reason this can't be here
         (only-in typed/racket
                  [#%module-begin tr:module-begin]
                  [require tr:require]))

(provide (except-out (all-from-out typed/racket) #%module-begin)
         (rename-out [module-begin #%module-begin])
         ;(all-from-out a-typed-lang/more)
         )

(define-syntax module-begin
  (lambda (stx)
    (syntax-case stx ()
      [(_ decl ...)
       #`(tr:module-begin
          #,(datum->syntax stx '(require a-typed-lang/more))
          decl ...)])))
