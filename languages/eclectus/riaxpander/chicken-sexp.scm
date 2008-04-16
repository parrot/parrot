(declare
 (export sexp/expand
         sexp/expand*
         make-sexp-environment))

(use srfi-1)
(use srfi-9)

(define (syntax-error message history . irritants)
  (error message irritants history))

(define classify-error syntax-error)

(include "history")
(include "closure")
(include "denotation")
(include "environment")
(include "transform")
(include "taxonomy")
(include "classify")
(include "standard")
(include "synrules")
(include "sexp")
