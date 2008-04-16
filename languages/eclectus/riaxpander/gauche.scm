(define-module riaxpander
  (use srfi-1)
  (use srfi-9)
  (export sexp/expand
          sexp/expand*
          make-sexp-environment))

(select-module riaxpander)

(define <syntactic-closure> #f)
(define <keyword> #f)
(define <sequence> #f)

(define (syntax-error message history . irritants)
  (error message irritants history))

(define classify-error syntax-error)

(for-each load
          '(
            "history.scm"
            "closure.scm"
            "denotation.scm"
            "environment.scm"
            "transform.scm"
            "taxonomy.scm"
            "classify.scm"
            "standard.scm"
            "synrules.scm"
            "sexp.scm"
            ))
