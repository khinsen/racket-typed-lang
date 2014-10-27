#lang typed-racket/minimal

(require typed/racket
         (only-in typed/racket
                  [#%module-begin tr:module-begin]
                  [require tr:require]))

(provide (except-out (all-from-out typed/racket) #%module-begin)
         (rename-out [module-begin #%module-begin]))

(define-syntax (module-begin ix)
  (syntax-case ix ()
    [(_ rest ...)
     (with-syntax
       ([rix
         ; tr:require keeps the meaning that it has in this module, but the
         ; s-exp as a whole lands in the *caller's* lexical context...
         (datum->syntax ix (list #'tr:require 'a-typed-lang/more))])
       #'(tr:module-begin
           rix
           rest ...))]))
