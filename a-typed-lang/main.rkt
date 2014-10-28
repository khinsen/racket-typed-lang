#lang typed-racket/minimal

; This module defines a typed language for the Racket environment.
; The basic approach is to use Typed Racket as a starting point,
; eventually remove some items, and adding others.
;
; To remove bindings from Typed Racket, they must not appear in any 
; (provide ...) form. There are two variants for doing this:
; 1) Provide all of Typed Racket *except* explicitly excluded bindings
; 2) Provide an explicitly given list of bindings.
;
; Additional bindings and syntax transformers are defined in the
; module a-typed-lang/more, which is explicitly added to each module
; using a-typed-lang.

(require typed/racket
         (only-in typed/racket
                  [#%module-begin tr:module-begin]
                  [require tr:require]))

; First variant: provide all of Typed Racket minus explicitly excluded
; bindings. Note that #%module-begin must be excluded because it is
; replaced by a modified version. This example somewhat arbitrarily
; excludes struct and struct: as well; for completely removing structure
; definitions, more work is required.

(provide (except-out (all-from-out typed/racket)
                     #%module-begin
                     struct struct:)
         (rename-out [module-begin #%module-begin]))

; Second variant: provide only explicitly listed bindings of Typed Racket.
; The following lists the strict minimum to run the example script.

;; (provide (rename-out [module-begin #%module-begin])
;;          #%app               ; required for function application
;;          #%datum             ; required for literals
;;          #%top-interaction   ; required for a REPL
;;          ; the bindings used in example.rkt:
;;          : Integer define displayln impersonator?)

; The new #%module-begin inserts a (require a-typed-lang/more) into
; each new module. This is a bit tricky because of the macro hygiene
; rules. A plain (require a-typed-lang/more) in the expanded form
; would be interpreted in the lexical context of this module
; (a-typed-lang/main), but not in the newly created module.
; Putting it into the caller's lexical context requires the use
; of datum->syntax shown below.
(define-syntax (module-begin ix)
  (syntax-case ix ()
    [(_ rest ...)
     (with-syntax
       ([rix (datum->syntax ix (list #'tr:require 'a-typed-lang/more))])
       #'(tr:module-begin
           rix
           rest ...))]))
