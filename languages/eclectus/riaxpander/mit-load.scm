;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; MIT Scheme Port
;;;; <http://www.gnu.org/software/mit-scheme/>

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

(define condition-type:syntax-error
  (make-condition-type 'SYNTAX-ERROR condition-type:error
      '(MESSAGE IRRITANTS HISTORY)
    (lambda (condition output-port)
      (format-error-message (access-condition condition 'MESSAGE)
                            (access-condition condition 'IRRITANTS)
                            output-port))))

(define signal-syntax-error
  (let ((make-condition
         (condition-constructor condition-type:syntax-error
                                '(MESSAGE IRRITANTS HISTORY))))
    (lambda (message irritants history wrapper)
      (call-with-current-continuation
        (lambda (continuation)
          ((lambda (signal)
             (if history
                 (with-syntax-replacement-restart (wrapper continuation)
                   signal)
                 (signal)))
           (lambda ()
             (let ((condition
                    (make-condition continuation 'BOUND-RESTARTS
                                    message irritants history)))
               (signal-condition condition)
               (standard-error-handler condition)))))))))

(define (with-syntax-replacement-restart continuation thunk)
  (with-restart 'USE-VALUE "Use a different form."
      continuation
      (lambda ()
        (values (prompt-for-expression "New form (not evaluated)")))
    thunk))

(define (syntax-error message history . irritants)
  (signal-syntax-error message irritants history identity-procedure))

(define (classify-error message history . irritants)
  (signal-syntax-error message irritants history
    (lambda (continuation)
      (lambda (form)
        ;** Be careful of multiple return values here.  They're broken
        ;** in MIT Scheme, so continuations are unary.
        (continuation (hook/reclassify form history))))))

(define (hook/reclassify form history)
  form history                          ;ignore
  (error "Classifier not yet available."))

;;; MIT Scheme is not quite R5RS-compliant in the area of EVAL
;;; environment specifiers.  This wouldn't be hard to fix, but no one
;;; has done it.  (Then again, INTERACTION-ENVIRONMENT is optional.)

(define (interaction-environment)
  (nearest-repl/environment))

(with-working-directory-pathname
    (directory-pathname (current-load-pathname))
  (lambda ()
    (for-each load
              '(
                "history"
                "closure"
                "denotation"
                "environment"
                "transform"
                "taxonomy"
                "classify"
                "standard"
                "synrules"
                ;; For now, we just use S-expression output.  Later
                ;; there ought to be an scode generator.
                "sexp"
                ))))

;;; Make things print more nicely.

(set-record-type-unparser-method! <syntactic-closure>
  (simple-unparser-method 'SYNTACTIC-CLOSURE
    (lambda (closure)
      (cons* (syntactic-closure/form closure)
             (syntactic-closure/free-names closure)
             (disclose-syntactic-environment
              (syntactic-closure/environment closure))))))

(set-record-type-unparser-method! <variable>
  (simple-unparser-method 'VARIABLE
    (lambda (variable)
      (list (variable/name variable)
            (variable/location variable)))))

(set-record-type-unparser-method! <syntactic-environment>
  (simple-unparser-method 'SYNTACTIC-ENVIRONMENT
    disclose-syntactic-environment))

(set! hook/reclassify reclassify)
