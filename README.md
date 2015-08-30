racket-typed-lang
=================

A bare-bones typed language implementation for Racket

This repository contains an example for a typed language implemented
in Racket, consisting of Typed Racket with extensions. This is
not trivial to do. The current version works thanks to a suggestion
by Evan Moran on the Racket user mailing list.

Usage
-----

1. Clone this repository:

  `git clone https://github.com/khinsen/racket-typed-lang`

2. Enter the repository directory:

  `cd racket-typed-lang`

3. Tell Racket about the collection `a-typed-lang`:

  `raco link a-typed-lang`

4. Run the example:

  `racket a-typed-lang/example.rkt`
