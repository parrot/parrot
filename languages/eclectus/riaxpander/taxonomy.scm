;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; Form Classification Taxonomy

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

;;; This file implements the types of possible values returned by CLASSIFY.

;;; Keywords are wrappers for syntactic denotations that may appear
;;; only at the heads of forms.  Keywords should be seen only inside
;;; the classifier.

(define-record-type <keyword>
    (make-keyword name denotation)
    keyword?
  (name keyword/name)
  (denotation keyword/denotation))

;;; Expressions, well, express values.  Locations represent the places
;;; where values can be stored, of which there may be access and
;;; assignment.  Locations, then, may double as expressions.
;;; Variable references may be classified as expressions or locations
;;; depending on the whims of the syntactic environment.

;;; It would be nice to have record subtypes here.  Locations are a
;;; subtype of expressions, really.

(define-record-type <expression>
    (make-expression compiler)
    %expression?
  (compiler expression/compiler))

;;; The names of the fields in locations are misleading.  The
;;; expression compiler is supplied by the client, and may be
;;; represented however it pleases; the assignment compiler is a
;;; binary procedure that takes the expression whose value to store in
;;; the location, and the history of the assignment, and returns an
;;; expression compiler in the previous sense.

(define-record-type <location>
    (make-location expression-compiler assignment-compiler)
    location?
  (expression-compiler location/expression-compiler)
  (assignment-compiler location/assignment-compiler))

(define (expression? object)
  (or (%expression? object)
      (location? object)
      (sequence? object)))

;;;; Sequences and Definitions

;;; Sequences suffer from a split personality disorder: they're not
;;; quite sure whether they are top-level collections of expressions
;;; and definitions together, whether they are sequences of internal
;;; definitions, or whether they are sequenced expressions.  The
;;; discrimination of sequences into these three categories is delayed
;;; until their context is known, and the subforms are not classified
;;; until then either.

(define-record-type <sequence>
    (make-sequence selector forms environment history)
    sequence?
  (selector sequence/selector)
  (forms sequence/forms)
  (environment sequence/environment)
  (history sequence/history))

;;; Definitions are an abstraction of anything that is not an
;;; expression that could conceivably occur at the top level, and
;;; anything that passes at the beginning of a lambda body as an
;;; internal definition.  This may be syntax definitions (yes, we
;;; support internal syntax definitions), declarations, &c.
;;; `Scanning' a definition means installing any keyword bindings
;;; (DEFINE-SYNTAX) or yielding any variable bindings (DEFINE; see
;;; `bindings' in the sense below), and possibly examining the
;;; right-hand side to determine whether it is a keyword or a variable
;;; binding (for a hypothetical overloaded DEFINE that allows both --
;;; see MAKE-OVERLOADED-DEFINITION in classify.scm).

(define-record-type <definition>
    (make-definition scanner)
    definition?
  (scanner definition/scanner))

;;; Bindings are the result of scanning variable definitions.  They
;;; contain the variable bound (not its name or location, but the
;;; variable record itself) and a procedure to classify the right-hand
;;; side expression.  This expression's classification is delayed so
;;; that forward macro references work.
;;;
;;; Bindings also store a reference to the definition environment, so
;;; that we can simplify the variable's name if desired.

(define-record-type <binding>
    (make-binding variable environment classifier)
    binding?
  (variable binding/variable)
  (environment binding/environment)
  (classifier binding/classifier))
