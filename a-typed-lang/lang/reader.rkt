#lang s-exp syntax/module-reader

a-typed-lang/main

#:read r:read
#:read-syntax r:read-syntax

(require (prefix-in r: typed-racket/typed-reader))
