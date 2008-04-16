;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; Classification

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

(define (classify form environment history)
  (cond ((pair? form)
         (classify-pair form environment history))
        ((symbol? form)
         (classify-name form environment history))
        ((syntactic-closure? form)
         (classify-syntactic-closure form environment history))
        (else
         ((datum-classifier environment) form environment history))))

;;; CLASSIFY-ERROR calls RECLASSIFY if the user has supplied a
;;; replacement form to classify instead.

(define (reclassify form history)
  ;++ Should this replace the reduction instead of adding a new one?
  (classify-reduction form
                      (reduction/environment
                       (history/current-reduction history))
                      history))

(define (classify-pair pair environment history)
  (receive (operator operator-history)
           (classify-subform car-selector (car pair) environment history)
    (if (keyword? operator)
        (classify/keyword operator pair environment history)
        (classify-combination operator operator-history
                              pair environment history))))

(define (classify-name name environment history)
  (cond ((syntactic-lookup environment name)
         => (lambda (denotation)
              (cond ((variable? denotation)
                     ((variable-classifier environment) denotation
                                                        name
                                                        environment
                                                        history))
                    ((or (classifier? denotation)
                         (transformer? denotation))
                     (values (make-keyword (close-syntax name environment)
                                           denotation)
                             history))
                    (else
                     (error "Invalid denotation:" denotation
                            name environment history)))))
        (else
         ((free-variable-classifier environment) name environment history))))

(define (classify-syntactic-closure form environment history)
  (let ((form* (syntactic-closure/form form)))
    (if (name? form*)
        (classify-name form environment history)
        (let ((environment*
               (syntactic-filter (syntactic-closure/environment form)
                                 (syntactic-closure/free-names form)
                                 environment)))
          (classify form*
                    environment*
                    (history/replace-reduction history form* environment*))))))

(define (classify/keyword keyword form environment history)
  (let ((name (keyword/name keyword))
        (denotation (keyword/denotation keyword)))
    (let ((form (cons name (cdr form))))
      (cond ((classifier? denotation)
             (classify/classifier name denotation form environment history))
            ((transformer? denotation)
             (classify/transformer name denotation form environment history))
            (else
             (error "Invalid keyword denotation:" denotation keyword))))))

(define (classify/classifier name classifier form environment history)
  name                                  ;ignore
  ((classifier/procedure classifier) form environment history))

(define (classify/transformer name transformer form environment history)
  (let ((form* (apply-transformer name transformer form environment)))
    (if (eq? form* form)
        (classify-error "Invalid syntax:" history form)
        (classify-reduction form* environment history))))

(define (classify-combination operator operator-history
                              combination environment history)
  ((combination-classifier environment)
   operator operator-history
   cdr-selector (cdr combination) environment history))

(define (classify-subform selector form environment history)
  (classify-subform* classify selector form environment history))

(define (classify-subform* classifier selector form environment history)
  (classifier form
              environment
              (history/add-subform history selector form environment)))

(define (classify-subforms selector forms environment history)
  (classify-subforms* classify selector forms environment history))

(define (classify-subforms* classifier selector forms environment history)
  (select-map selector forms
    (lambda (selector form)
      (receive (classification history)
               (classify-subform* classifier selector form environment history)
        history                         ;ignore
        classification))))

(define (classify-reduction form environment history)
  (classify form environment (history/add-reduction history form environment)))

(define (guarded-classifier predicate error-message)
  (lambda (form environment history)
    (let loop ((classifier (lambda () (classify form environment history))))
      (receive (classification history) (classifier)
        (if (predicate classification)
            (values classification history)
            (loop
             (lambda ()
               (classify-error error-message history classification))))))))

;;;; Classification Utilities

;;; We could simplify this page with macros, if we allowed ourselves
;;; to use macros.

(define classify-expression
  (guarded-classifier (lambda (classification) (expression? classification))
                      "Non-expression in expression context:"))

(define (classify-subexpression selector form environment history)
  (classify-subform* classify-expression selector form environment history))

(define (classify-subexpressions selector forms environment history)
  (classify-subforms* classify-expression selector forms environment history))

(define classify-definition
  (guarded-classifier (lambda (classification) (definition? classification))
                      "Non-definition in definition context:"))

(define (classify-subdefinition selector form environment history)
  (classify-subform* classify-definition selector form environment history))

(define (classify-subdefinitions selector forms environment history)
  (classify-subforms* classify-definition selector forms environment history))

(define classify-location
  (guarded-classifier (lambda (classification) (location? classification))
                      "Non-location in location context:"))

(define (classify-sublocation selector form environment history)
  (classify-subform* classify-location selector form environment history))

(define (classify-sublocations selector forms environment history)
  (classify-subforms* classify-location selector forms environment history))

(define classify-keyword
  (guarded-classifier (lambda (classification) (keyword? classification))
                      "Non-keyword in keyword context:"))

(define (classify-subkeyword selector form environment history)
  (classify-subform* classify-keyword selector form environment history))

(define (classify-subkeywords selector forms environment history)
  (classify-subforms* classify-keyword selector forms environment history))

;;;; Temporary Classifiers

;;; These must be extremely careful only to generate aliases for
;;; syntactic bindings, never for variables!  They must be gone in the
;;; expander's output, because we have no way to find them after the
;;; expander is finished, since these keywords are entirely anonymous.

(define (keyword-denotation->operator denotation)
  (close-syntax 'KEYWORD
                (let ((environment
                       (syntactic-extend (null-syntactic-environment #f))))
                  (syntactic-bind! environment 'KEYWORD denotation)
                  environment)))

(define (classifier->operator procedure)
  (keyword-denotation->operator (make-classifier #f procedure)))

(define (classifier->form procedure)
  `(,(classifier->operator procedure)))

(define (transformer->operator environment auxiliary-names procedure)
  (keyword-denotation->operator
   (make-transformer environment auxiliary-names procedure #f)))

(define (transformer->form environment auxiliary-names procedure)
  `(,(transformer->operator environment auxiliary-names procedure)))

(define (capture-syntactic-environment receiver)
  (classifier->form
   (lambda (form environment history)
     form                               ;ignore
     (classify-reduction (receiver environment) environment history))))

(define (capture-expansion-history receiver)
  (classifier->form
   (lambda (form environment history)
     form                               ;ignore
     (classify-reduction (receiver history) environment history))))

;;; These names are backwards, but this is compatible with MIT Scheme.

(define (call-with-syntax-error-procedure receiver)
  (capture-expansion-history
   (lambda (history)
     (receiver
      (lambda (message . irritants)
        (apply syntax-error message history
               (and history
                    (reduction/form (history/current-reduction history)))
               irritants))))))

(define (capture-syntax-error-procedure receiver)
  (classifier->form
   (lambda (form environment history)
     form                               ;ignore
     (classify-reduction
      (receiver
       (lambda (message selector form . irritants)
         (apply syntax-error
                message
                (history/add-subform history selector form environment)
                form
                irritants)))
      environment
      history))))

;;;; Sequence Scanning

(define (classify-sequence selector forms environment history)
  (if (and (pair? forms) (null? (cdr forms)))
      (classify-subform (select-car selector) (car forms) environment history)
      (values (make-sequence selector forms environment history) history)))

(define (classify/sequence scanner sequence)
  (scanner (sequence/selector sequence)
           (sequence/forms sequence)
           (sequence/environment sequence)
           (sequence/history sequence)))

(define (scan-expression expression environment)
  environment
  (list expression))

(define (scan-definition definition environment)
  ((definition/scanner definition) environment))

(define (scan-top-level selector forms environment history)
  (let loop ((selector selector) (forms forms) (result '()))
    (if (pair? forms)
        (loop (select-cdr selector)
              (cdr forms)
              (append-reverse (scan-top-level-form (select-car selector)
                                                   (car forms)
                                                   environment
                                                   history)
                              result))
        (reverse result))))

(define (scan-top-level-form selector form environment history)
  (let loop ((classifier
              (lambda ()
                (classify-subform selector form environment history))))
    (receive (classification history) (classifier)
      (cond ((sequence? classification)
             (classify/sequence scan-top-level classification))
            ((definition? classification)
             (scan-definition classification environment))
            ((expression? classification)
             (scan-expression classification environment))
            (else
             (loop (lambda ()
                     (classify-error "Invalid top-level form:"
                                     history
                                     form))))))))

;;;;; Homogeneous Sequences

(define (homogeneous-sequence-scanner predicate sequent-scanner error-message)
  (define (scan-sequent selector form environment history)
    (let loop ((classifier
                (lambda ()
                  (classify-subform selector form environment history))))
      (receive (classification history) (classifier)
        (cond ((sequence? classification)
               (classify/sequence scan-sequence classification))
              ((predicate classification)
               (sequent-scanner classification environment))
              (else
               (loop
                (lambda ()
                  (classify-error error-message history classification))))))))
  (define (scan-sequence selector forms environment history)
    (let loop ((selector selector) (forms forms) (history history) (items '()))
      (if (pair? forms)
          (loop (select-cdr selector)
                (cdr forms)
                history
                (append-reverse (scan-sequent (select-car selector)
                                              (car forms)
                                              environment
                                              history)
                                items))
          (reverse items))))
  scan-sequence)

(define scan-expressions
  (homogeneous-sequence-scanner expression?
                                scan-expression
                                "Non-expression in expression sequence:"))

(define scan-definitions
  (homogeneous-sequence-scanner definition?
                                scan-definition
                                "Non-definition in definition sequence:"))

;;;;; R5RS Internal Definitions

;++ This should report better errors about bodies with no expressions.

(define (scan-r5rs-body selector forms environment history)
  (let loop ((selector selector) (forms forms) (bindings '()))
    (if (pair? forms)
        ((scan-r5rs-body-form (select-car selector)
                              (car forms)
                              environment
                              history)
         (lambda ()                     ;if-empty
           (loop (select-cdr selector) (cdr forms) bindings))
         (lambda (bindings*)            ;if-definitions
           (loop (select-cdr selector)
                 (cdr forms)
                 (append-reverse bindings* bindings)))
         (lambda (expressions)          ;if-expressions
           (values (reverse bindings)
                   (append expressions
                           (scan-expressions (select-cdr selector)
                                             (cdr forms)
                                             environment
                                             history)))))
        (error "Body sequence contains no expressions!" history))))

(define (scan-r5rs-body-form selector form environment history)
  (lambda (if-empty if-definitions if-expressions)
    (let loop ((classifier
                (lambda ()
                  (classify-subform selector form environment history))))
      (receive (classification history) (classifier)
        (cond ((sequence? classification)
               ((classify/sequence scan-r5rs-subsequence classification)
                if-empty if-definitions if-expressions))
              ((definition? classification)
               (if-definitions (scan-definition classification environment)))
              ((expression? classification)
               (if-expressions (scan-expression classification environment)))
              (else
               (loop (lambda ()
                       (classify-error "Invalid sequence element:"
                                       history
                                       classification)))))))))

(define (scan-r5rs-subsequence selector forms environment history)
  (lambda (if-empty if-definitions if-expressions)
    (let loop ((selector selector) (forms forms))
      (define (scan scanner)
        (scanner (select-cdr selector) (cdr forms) environment history))
      (if (pair? forms)
          ((scan-r5rs-body-form (select-car selector)
                                (car forms)
                                environment
                                history)
           (lambda ()
             (loop (select-cdr selector) (cdr forms)))
           (lambda (definitions)
             (if-definitions (append definitions (scan scan-definitions))))
           (lambda (expressions)
             (if-expressions (append expressions (scan scan-expressions)))))
          (if-empty)))))

;;;;; R6RS Internal Definitions

;;; The difference between R5RS bodies and R6RS bodies is whether the
;;; boundary between expressions and definitions may occur within an
;;; internal sequence.  The R5RS forbids (BEGIN <definition> ...
;;; <expression> ...), whereas the R6RS permits it.

(define (scan-r6rs-body selector forms environment history)
  (receive (bindings expressions)
      (scan-r6rs-subsequence selector forms environment history)
    (if (pair? expressions)
        (values bindings expressions)
        (error "Body sequence contains no expressions!" history))))

(define (scan-r6rs-subsequence selector forms environment history)
  (let loop ((selector selector) (forms forms) (bindings '()))
    (if (pair? forms)
        (receive (bindings* expressions)
            (scan-r6rs-body-form (select-car selector)
                                 (car forms)
                                 environment
                                 history)
          (let ((bindings** (append-reverse bindings* bindings)))
            (if (pair? expressions)
                (values (reverse bindings**)
                        (append expressions
                                (scan-expressions (select-cdr selector)
                                                  (cdr forms)
                                                  environment
                                                  history)))
                (loop (select-cdr selector)
                      (cdr forms)
                      bindings**))))
        (values (reverse bindings) '()))))

(define (scan-r6rs-body-form selector form environment history)
  (let loop ((classifier
              (lambda ()
                (classify-subform selector form environment history))))
    (receive (classification history) (classifier)
      (cond ((sequence? classification)
             (classify/sequence scan-r6rs-subsequence classification))
            ((definition? classification)
             (values (scan-definition classification environment) '()))
            ((expression? classification)
             (values '() (scan-expression classification environment)))
            (else
             (loop (lambda ()
                       (classify-error "Invalid sequence element:"
                                       history
                                       classification))))))))

;;;; Definitions

(define (make-variable-definition name-selector name form-selector form
                                  environment history)
  name-selector                         ;ignore
  (make-definition
   (lambda (definition-environment)
     (variable-binding name definition-environment
       (lambda ()
         (classify-subexpression form-selector form environment history))))))

(define (variable-binding name environment classifier)
  (list
   (make-binding (bind-variable! name environment) environment classifier)))

(define (make-keyword-definition name-selector name form-selector form
                                 environment history)
  name-selector                         ;ignore
  (make-definition
   (lambda (definition-environment)
     (receive (keyword keyword-history)
              (classify-subkeyword form-selector form environment history)
       keyword-history                  ;ignore
       (keyword-binding name definition-environment keyword)))))

(define (keyword-binding name environment keyword)
  (syntactic-bind! environment name (keyword/denotation keyword))
  '())

(define (make-overloaded-definition name-selector name form-selector form
                                    environment history)
  name-selector                         ;ignore
  (make-definition
   (lambda (definition-environment)
     (let loop ((classifier
                 (lambda ()
                   (classify-subform form-selector form environment history))))
       (receive (classification history) (classifier)
         (cond ((keyword? classification)
                (keyword-binding name definition-environment classification))
               ((expression? classification)
                (variable-binding name definition-environment
                                  (lambda ()
                                    (values classification history))))
               (else
                (loop
                 (lambda ()
                   (classify-error "Invalid right-hand side of definition:"
                                   history
                                   classification))))))))))
