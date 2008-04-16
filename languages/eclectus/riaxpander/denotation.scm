;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; Denotations

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

(define-record-type <classifier>
    (make-classifier name procedure)
    classifier?
  (name classifier/name)
  (procedure classifier/procedure))

(define-record-type <transformer>
    (make-transformer environment auxiliary-names procedure source)
    transformer?
  (environment transformer/environment)
  (auxiliary-names transformer/auxiliary-names)
  (procedure transformer/procedure)
  (source transformer/source))

(define-record-type <variable>
    (make-variable name location)
    variable?
  (name variable/name)
  (location variable/location))

(define (denotation=? denotation-a denotation-b)
  (or (eq? denotation-a denotation-b)
      (and (variable? denotation-a)
           (variable? denotation-b)
           (eqv? (variable/location denotation-a)
                 (variable/location denotation-b)))))
