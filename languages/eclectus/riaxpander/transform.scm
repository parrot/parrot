;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; Transformer Application

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

(define (apply-transformer name transformer form usage-environment)
  ((transformer/procedure transformer)
   form
   usage-environment
   (syntactic-transformer-extend (transformer/environment transformer)
                                 name
                                 usage-environment)))

(define (make-rsc-macro-transformer-procedure procedure)
  (lambda (form usage-environment closing-environment)
    ;; We need not close this in the usage environment, because the
    ;; classifier will classify it there anyway.  (This is a mildly
    ;; leaky abstraction.)
    usage-environment                   ;ignore
    (procedure form closing-environment)))

(define make-rsc-macro-transformer-macrology
  (transformer-macrology-maker make-rsc-macro-transformer-procedure))

(define (make-sc-macro-transformer-procedure procedure)
  (lambda (form usage-environment closing-environment)
    (close-syntax (procedure form usage-environment)
                  closing-environment)))

(define make-sc-macro-transformer-macrology
  (transformer-macrology-maker make-sc-macro-transformer-procedure))

(define (make-er-macro-transformer-procedure procedure)
  (lambda (form usage-environment closing-environment)
    (procedure form
               (make-alias-generator closing-environment)
               (make-name-comparator usage-environment))))

(define make-er-macro-transformer-macrology
  (transformer-macrology-maker make-er-macro-transformer-procedure))

(define (make-alias-generator closing-environment)
  (lambda (name)
    (syntactic-alias closing-environment name)))

(define (make-name-comparator usage-environment)
  (lambda (name-a name-b)
    (or (eq? name-a name-b)
        (and (name? name-a)
             (name? name-b)
             (name=? usage-environment name-a
                     usage-environment name-b)))))
