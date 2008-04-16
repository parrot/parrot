;;; -*- Mode: Scheme; scheme48-package: (config) -*-

;;;; Riaxpander
;;;; Scheme48 Interface Definitions

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

(define-interface syntactic-interface
  (export
    sexp/expand
    sexp/expand*
    make-sexp-environment
    ))

(define-interface syntactic-standard-macrology-interface
  (export
    ;; Primitive syntax
    macrology/standard-assignment
    macrology/standard-conditional
    macrology/standard-lambda
    macrology/standard-quotation
    macrology/standard-sequence
    macrology/standard-syntactic-binding

    ;; Definition syntax
    macrology/curried-definition
    macrology/overloaded-definition
    macrology/standard-definition
    macrology/standard-keyword-definition

    ;; Derived syntax
    macrology/standard-derived-syntax   ;Subsumes the following:
    macrology/standard-boolean-connectives
    macrology/standard-iteration
    macrology/standard-derived-conditional
    macrology/standard-variable-binding
    macrology/standard-quasiquote

    ;; Pattern language
    macrology/syntax-rules

    ;; Non-standard syntactic extensions
    macrology/non-standard-macro-transformers
    macrology/syntax-quote
    ))

(define-interface syntactic-classifier-interface
  (export
    classify
    reclassify
    classify-reduction
    classify-subform
    classify-subform*
    classify-subforms
    classify-subforms*
    guarded-classifier
    classify-definition classify-subdefinition  classify-subdefinitions
    classify-expression classify-subexpression  classify-subexpressions
    classify-location   classify-sublocation    classify-sublocations
    classify-keyword    classify-subkeyword     classify-subkeywords
    classifier->operator        classifier->form
    transformer->operator       transformer->form
    capture-syntactic-environment
    capture-expansion-history
    capture-syntax-error-procedure
    call-with-syntax-error-procedure
    classify-sequence
    classify/sequence
    scan-expressions
    scan-definitions
    scan-top-level
    scan-r5rs-body
    scan-r6rs-body
    make-variable-definition
    make-keyword-definition
    make-overloaded-definition
    ))

(define-interface syntactic-transformation-interface
  (export
    apply-transformer
    make-er-macro-transformer-macrology
    make-er-macro-transformer-procedure
    make-rsc-macro-transformer-macrology
    make-rsc-macro-transformer-procedure
    make-sc-macro-transformer-macrology
    make-sc-macro-transformer-procedure
    make-alias-generator
    make-name-comparator
    ))

(define-interface syntactic-taxonomy-interface
  (export
    <keyword>
    make-keyword
    keyword?
    keyword/name
    keyword/denotation

    <expression>
    make-expression
    expression?
    expression/compiler

    <location>
    make-location
    location?
    location/expression-compiler
    location/assignment-compiler

    <sequence>
    make-sequence
    sequence?
    sequence/selector
    sequence/forms
    sequence/environment
    sequence/history

    <definition>
    make-definition
    definition?
    definition/scanner

    <binding>
    make-binding
    binding?
    binding/variable
    binding/environment
    binding/classifier
    ))

(define-interface syntactic-environments-interface
  (export
    <syntactic-environment>
    make-syntactic-environment
    syntactic-environment?
    syntactic-environment/parent
    syntactic-environment/data
    set-syntactic-environment/data!
    syntactic-environment/parameters

    <syntactic-operations>
    make-syntactic-operations
    syntactic-operations?

    null-syntactic-environment
    syntactic-extend
    syntactic-splicing-extend
    syntactic-transformer-extend
    syntactic-filter

    syntactic-parameter
    syntactic-lookup
    syntactic-bind!
    syntactic-seal!
    syntactic-alias
    disclose-syntactic-environment
    for-each-syntactic-binding
    bind-variable!
    name=?
    symbol->name
    datum->syntax
    syntactic-environment/transformer-reference

    variable-classifier
    free-variable-classifier
    datum-classifier
    combination-classifier
    self-evaluating?
    location-allocator
    meta-evaluator
    meta-evaluate

    apply-macrology
    null-macrology
    make-classifier-macrology
    transformer-macrology-maker
    compose-macrologies
    ))

(define-interface syntactic-denotations-interface
  (export
    denotation=?

    <classifier>
    make-classifier
    classifier?
    classifier/name
    classifier/procedure

    <transformer>
    make-transformer
    transformer?
    transformer/environment
    transformer/auxiliary-names
    transformer/procedure
    transformer/source

    <variable>
    make-variable
    variable?
    variable/name
    variable/location
    ))

(define-interface syntactic-closures-interface
  (export
    <syntactic-closure>
    syntactic-closure?
    syntactic-closure/environment
    syntactic-closure/free-names
    syntactic-closure/form
    make-syntactic-closure
    make-syntactic-closures
    close-syntax
    close-syntax*
    name?
    alias?
    name->symbol
    syntax->datum
    ))

(define-interface syntactic-history-interface
  (export
    make-reduction
    reduction/form
    reduction/environment

    make-top-level-history
    top-level-history?
    history/reductions
    history/parent-selector
    history/parent-history
    history/current-reduction
    history/original-reduction
    history/current-form
    history/current-environment
    history/original-form
    history/original-environment
    history/add-reduction
    history/replace-reduction
    history/add-subform

    apply-selector
    select-car
    select-cdr
    select-map
    select-append-map
    select-for-each

    identity-selector
    car-selector
    cdr-selector
    caar-selector
    cadr-selector
    cdar-selector
    cddr-selector
    caaar-selector
    caadr-selector
    cadar-selector
    caddr-selector
    cdaar-selector
    cdadr-selector
    cddar-selector
    cdddr-selector
    caaaar-selector
    caaadr-selector
    caadar-selector
    caaddr-selector
    cadaar-selector
    cadadr-selector
    caddar-selector
    cadddr-selector
    cdaaar-selector
    cdaadr-selector
    cdadar-selector
    cdaddr-selector
    cddaar-selector
    cddadr-selector
    cdddar-selector
    cddddr-selector
    ))

(define-interface syntactic-errors-interface
  (export
    error
    syntax-error
    classify-error
    ))
