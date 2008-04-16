;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; Syntactic Environments

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

(define-record-type <syntactic-environment>
    (make-syntactic-environment operations parameters parent data)
    syntactic-environment?
  (operations syntactic-environment/operations)
  (parameters syntactic-environment/parameters)
  (parent syntactic-environment/parent)
  (data syntactic-environment/data set-syntactic-environment/data!))

(define-record-type <syntactic-operations>
    (make-syntactic-operations lookup
                               bind!
                               seal!
                               alias
                               disclose
                               for-each-binding)
    syntactic-operations?
  (lookup syntactic-operations/lookup)
  (bind! syntactic-operations/bind!)
  (seal! syntactic-operations/seal!)
  (alias syntactic-operations/alias)
  (disclose syntactic-operations/disclose)
  (for-each-binding syntactic-operations/for-each-binding))

(define (null-syntactic-environment parameters . context)
  (make-syntactic-environment null-syntactic-operations parameters #f context))

(define null-syntactic-operations
  (let ()
    (define (lose operation)
      (error "Null syntactic environment:" operation))
    (make-syntactic-operations
     (lambda (environment name)
       (lose `(SYNTACTIC-LOOKUP ,environment ,name)))
     (lambda (environment name denotation)
       (lose `(SYNTACTIC-BIND! ,environment ,name ,denotation)))
     (lambda (environment)
       (lose `(SYNTACTIC-SEAL! ,environment)))
     (lambda (environment name)
       (lose `(SYNTACTIC-ALIAS ,environment ,name)))
     (lambda (environment)
       `(NULL ,@(syntactic-environment/data environment)))
     (lambda (environment procedure)
       environment procedure            ;ignore
       (if #f #f)))))

(define (syntactic-parameter environment key)
  ((syntactic-environment/parameters environment) key))

(define (syntactic-lookup environment name)
  ((syntactic-operations/lookup (syntactic-environment/operations environment))
   environment name))

(define (syntactic-bind! environment name denotation)
  ((syntactic-operations/bind! (syntactic-environment/operations environment))
   environment name denotation))

;;; `Sealing' changes the state of the environment to indicate that no
;;; further changes will be made to it.  In the case of splicing
;;; environments, this means that all new bindings will be made in the
;;; parent; in the case of extended environments, this means that the
;;; local variables can be converted into a better representation for
;;; fast lookup.

(define (syntactic-seal! environment)
  ((syntactic-operations/seal! (syntactic-environment/operations environment))
   environment))

(define (syntactic-alias environment name)
  ((syntactic-operations/alias (syntactic-environment/operations environment))
   environment name))

(define (disclose-syntactic-environment environment)
  ((syntactic-operations/disclose
    (syntactic-environment/operations environment))
   environment))

(define (for-each-syntactic-binding environment procedure)
  (let walk ((environment environment))
    ((syntactic-operations/for-each-binding
      (syntactic-environment/operations environment))
     environment procedure)
    (cond ((syntactic-environment/parent environment)
           => walk))))

(define (bind-variable! name environment)
  (let ((variable (make-variable name (allocate-location environment name))))
    (syntactic-bind! environment name variable)
    variable))

(define (name=? environment-a name-a environment-b name-b)
  (let ((denotation-a (syntactic-lookup environment-a name-a))
        (denotation-b (syntactic-lookup environment-b name-b)))
    (cond ((and denotation-a denotation-b)
           (denotation=? denotation-a denotation-b))
          ((and (not denotation-a) (not denotation-b))
           (eq? (name->symbol name-a)
                (name->symbol name-b)))
          (else #f))))

(define (symbol->name transformer-reference name)
  (if (syntactic-closure? transformer-reference)
      (syntactic-alias (syntactic-closure/environment transformer-reference)
                       name)
      name))

(define (datum->syntax transformer-reference datum)
  (let recur ((datum datum))
    (cond ((pair? datum) (cons (recur (car datum)) (recur (cdr datum))))
          ((name? datum) (symbol->name transformer-reference datum))
          (else datum))))

;;;; Syntactic Parameters

;;; These are operations not intrinsic to the concept of syntactic
;;; environments; they are supplied by the client of the syntactic
;;; environment abstraction, primarily to control the format of the
;;; output.

;;; The access path for syntactic parameters is faster than that for
;;; name lookup, because we can elide the hierarchy.  When
;;; constructing a syntactic environment, it usually contains a copy
;;; of the reference to the parent's syntactic parameters, so there is
;;; no iterative indirection, as there is for name lookup.  Deeply
;;; nested binding forms, then, pose no problem for the performance of
;;; these procedures.

(define (variable-classifier environment)
  (syntactic-parameter environment variable-classifier))

(define (free-variable-classifier environment)
  (syntactic-parameter environment free-variable-classifier))

(define (datum-classifier environment)
  (syntactic-parameter environment datum-classifier))

(define (combination-classifier environment)
  (syntactic-parameter environment combination-classifier))

(define (self-evaluating? datum environment)
  ((syntactic-parameter environment self-evaluating?) datum))

(define (location-allocator environment)
  (syntactic-parameter environment location-allocator))

(define (allocate-location environment name)
  ((location-allocator environment) environment name))

(define (meta-evaluator environment)
  (syntactic-parameter environment meta-evaluator))

(define (meta-evaluate form environment)
  ((meta-evaluator environment) form environment))

;;;; Macrologies

(define (apply-macrology macrology environment)
  (macrology environment))

(define null-macrology
  (lambda (environment)
    environment                         ;ignore
    (values)))

(define (make-classifier-macrology receiver)
  (lambda (environment)
    (define (define-classifier name procedure)
      (syntactic-bind! environment name (make-classifier name procedure)))
    (receiver define-classifier)))

(define (transformer-macrology-maker map-procedure)
  (lambda (receiver)
    (lambda (environment)
      (define (define-transformer name procedure auxiliary-names)
        (syntactic-bind! environment
                         name
                         (make-transformer environment
                                           auxiliary-names
                                           (map-procedure procedure)
                                           ;; No source record.
                                           #f)))
      (receiver define-transformer))))

(define make-transformer-macrology
  (transformer-macrology-maker (lambda (procedure) procedure)))

(define (compose-macrologies . macrologies)
  (compose-macrology-list macrologies))

(define (compose-macrology-list macrologies)
  (reduce compose-macrology null-macrology macrologies))

(define (compose-macrology macrology-a macrology-b)
  (lambda (environment)
    (macrology-a environment)
    (macrology-b environment)))

;;;; Extended Environments

;;; Extended environments are simply frames in the environment tree
;;; in which local bindings can be introduced.

(define (syntactic-extend environment)
  (make-syntactic-environment extended-syntactic-operations
                              (syntactic-environment/parameters environment)
                              environment
                              '()))

(define extended-syntactic-operations
  (let ()
    (define (local-bindings environment)
      (syntactic-environment/data environment))
    (define (set-local-bindings! environment bindings)
      (set-syntactic-environment/data! environment bindings))
    (make-syntactic-operations
     (lambda (environment name)         ;lookup
       (cond ((assq name (local-bindings environment))
              => cdr)
             (else
              (syntactic-lookup (syntactic-environment/parent environment)
                                name))))
     (lambda (environment name denotation) ;bind!
       ;++ This should report more useful (and restartable) errors.
       (cond ((assq name (local-bindings environment))
              => (lambda (original-binding)
                   (error "Rebinding name:" environment name denotation
                          `(was ,(cdr original-binding)))))
             (else
              (set-local-bindings! environment
                                   (cons (cons name denotation)
                                         (local-bindings environment))))))
     (lambda (environment)              ;seal!
       environment ;ignore
       (if #f #f))
     (lambda (environment name)         ;alias
       (syntactic-alias (syntactic-environment/parent environment) name))
     (lambda (environment)              ;disclose
       `(EXTENDED ,(map car (local-bindings environment))))
     (lambda (environment procedure)    ;for-each-binding
       (for-each (lambda (binding)
                   (procedure (car binding) (cdr binding) environment))
                 (local-bindings environment))))))

;;;; Splicing Environments

;;; These are for implementing LET-SYNTAX and LETREC-SYNTAX.

(define (syntactic-splicing-extend environment)
  (make-syntactic-environment splicing-syntactic-operations
                              (syntactic-environment/parameters environment)
                              environment
                              (cons #f '())))

(define splicing-syntactic-operations
  (let ()
    (define (sealed? environment)
      (car (syntactic-environment/data environment)))
    (define (seal! environment)
      (set-car! (syntactic-environment/data environment) #t))
    (define (local-bindings environment)
      (cdr (syntactic-environment/data environment)))
    (define (set-local-bindings! environment bindings)
      (set-cdr! (syntactic-environment/data environment) bindings))
    (make-syntactic-operations
     (lambda (environment name)         ;lookup
       (cond ((assq name (local-bindings environment))
              => cdr)
             (else
              (syntactic-lookup (syntactic-environment/parent environment)
                                name))))
     (lambda (environment name denotation) ;bind!
       (cond ((assq name (local-bindings environment))
              => (lambda (original-binding)
                   (error "Rebinding name:" environment name denotation
                          `(was ,(cdr original-binding)))))
             ((sealed? environment)
              (syntactic-bind! (syntactic-environment/parent environment)
                               name
                               denotation))
             (else
              (set-local-bindings! environment
                                   (cons (cons name denotation)
                                         (local-bindings environment))))))
     (lambda (environment)              ;seal!
       (seal! environment))
     (lambda (environment name)         ;alias
       (syntactic-alias (syntactic-environment/parent environment) name))
     (lambda (environment)              ;disclose
       `(SPLICING ,(map car (local-bindings environment))))
     (lambda (environment procedure)    ;for-each-binding
       (for-each (lambda (binding)
                   (procedure (car binding) (cdr binding) environment))
                 (local-bindings environment))))))

;;;; Transformer Environments

;;; Transformer environments record the name by which a transformer
;;; was invoked in its site of usage.  This is used to find the origin
;;; of an alias, which is necessary for program module linkage in the
;;; presence of hygienic macros.  Transformer environments also record
;;; a cache for generated aliases.

(define (syntactic-transformer-extend environment
                                      transformer-reference
                                      usage-environment)
  (make-syntactic-environment
   transformer-syntactic-operations
   (syntactic-environment/parameters environment)
   environment
   (cons '()
         (simplify-transformer-reference environment
                                         transformer-reference
                                         usage-environment))))

(define (simplify-transformer-reference parent-environment
                                        transformer-reference
                                        usage-environment)
  (let loop ((transformer-reference transformer-reference))
    (if (not (syntactic-closure? transformer-reference))
        transformer-reference
        (let ((form (syntactic-closure/form transformer-reference)))
          (if (name=? usage-environment form
                      usage-environment transformer-reference)
              (loop form)
              transformer-reference)))))

(define (syntactic-environment/transformer-reference environment)
  (let loop ((environment environment))
    (cond ((eq? transformer-syntactic-operations
                (syntactic-environment/operations environment))
           (cdr (syntactic-environment/data environment)))
          ((syntactic-environment/parent environment)
           => loop)
          (else #f))))

;;;;; Transformer Environment Syntactic Operations

(define transformer-syntactic-operations
  (let ()
    (define (alias-cache environment)
      (car (syntactic-environment/data environment)))
    (define (set-alias-cache! environment cache)
      (set-car! (syntactic-environment/data environment) cache))
    (define (transformer-reference environment)
      (cdr (syntactic-environment/data environment)))
    (make-syntactic-operations
     (lambda (environment name)         ;lookup
       (syntactic-lookup (syntactic-environment/parent environment) name))
     (lambda (environment name denotation) ;bind!
       (syntactic-bind! (syntactic-environment/parent environment)
                        name
                        denotation))
     (lambda (environment)              ;seal!
       environment ;ignore
       (if #f #f))
     (lambda (environment name)         ;alias
       (cdr (let ((cache (alias-cache environment)))
              (or (assq name cache)
                  (let ((entry (cons name (close-syntax name environment))))
                    (set-alias-cache! environment (cons entry cache))
                    entry)))))
     (lambda (environment)              ;disclose
       `(TRANSFORMER ,(transformer-reference environment)))
     (lambda (environment procedure)    ;for-each-binding
       environment procedure ;ignore
       (if #f #f)))))

;;;; Filtered Environments

;;; Filtered environments are used to classify the form of a syntactic
;;; closure; they make the free names of syntactic closures work.

(define (syntactic-filter closing-environment free-names free-environment)
  (if (or (not (pair? free-names))
          (eq? closing-environment free-environment))
      closing-environment
      (make-syntactic-environment
       filtered-syntactic-operations
       (syntactic-environment/parameters closing-environment)
       closing-environment
       (cons free-environment free-names))))

(define filtered-syntactic-operations
  (let ()
    (define (closing-environment environment)
      (syntactic-environment/parent environment))
    (define (free-environment environment)
      (car (syntactic-environment/data environment)))
    (define (free-names environment)
      (cdr (syntactic-environment/data environment)))
    (define (choose-parent environment name)
      ((if (memq name (free-names environment))
           free-environment
           closing-environment)
       environment))
    (make-syntactic-operations
     (lambda (environment name)         ;lookup
       (syntactic-lookup (choose-parent environment name) name))
     (lambda (environment name denotation) ;bind!
       (syntactic-bind! (choose-parent environment name) name denotation))
     (lambda (environment)              ;seal!
       environment ;ignore
       (if #f #f))
     (lambda (environment name)         ;alias
       (syntactic-alias (choose-parent environment name) name))
     (lambda (environment)              ;disclose
       `(FILTERED ,(free-names environment)))
     (lambda (environment procedure)    ;for-each-binding
       (for-each (let ((environment (free-environment environment)))
                   (lambda (free-name)
                     (cond ((syntactic-lookup environment free-name)
                            => (lambda (denotation)
                                 (procedure free-name
                                            denotation
                                            environment))))))
                 (free-names environment))))))
