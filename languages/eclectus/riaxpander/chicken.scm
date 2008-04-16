;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; Chicken Port
;;;; <http://www.call-with-current-continuation.org/>

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

;;; This system requires that Chicken be set into case-insensitive
;;; mode.  To load the system, simply (compile and) load this file.

(eval-when (compile eval)
  (if (not (eq? (read (open-input-string "FOO"))
                (read (open-input-string "foo"))))
      (error "Please run Chicken in standards-compliant mode.")))

(declare
  (export
    riaxpander:install
    riaxpander:expand
    riaxpander:expand-toplevel
    ##sys#compiler-toplevel-macroexpand-hook
    ##sys#interpreter-toplevel-macroexpand-hook
    macroexpand
    name?
    name=?
    name->symbol
    symbol->name
    datum->syntax
    syntax->datum
    make-syntactic-closure
    make-syntactic-closures
    close-syntax
    close-syntax*
    capture-syntactic-environment
    capture-expansion-history
    capture-syntax-error-procedure
    call-with-syntax-error-procedure
    ;++ more exports
    ))

(define (syntax-error message history . irritants)
  history                               ;ignore
  (apply ##sys#syntax-error-hook message irritants))

(define classify-error syntax-error)

(use srfi-1)                            ;list-lib
(include "history")
(include "closure")
(include "denotation")
(include "environment")
(include "transform")
(include "taxonomy")
(include "classify")
(include "standard")
(include "synrules")

(define (riaxpander:expand form environment)
  (parameterize ((current-location-uid 0))
    ((lambda (results)
       (if (and (pair? results)
                (null? (cdr results)))
           (car results)
           `(BEGIN ,@results)))
     (map (lambda (item)
            (cond ((binding? item) (chicken/compile-binding item))
                  ((declaration? item) (chicken/compile-declaration item))
                  ((expression? item) (chicken/compile-expression item))
                  (else (error "Invalid top-level item:" item))))
          (let ((forms (list form)))
            (scan-top-level identity-selector
                            forms
                            environment
                            (make-top-level-history forms environment)))))))

(define (riaxpander:expand-toplevel form)
  (riaxpander:expand form
                     (or riaxpander:top-level-environment
                         (make-chicken-environment))))

(define riaxpander:top-level-environment #f)

(define (riaxpander:install)
  ;++ Perhaps this should preserve the original values of the hooks.
  (set! riaxpander:top-level-environment (make-chicken-environment))
  (set! ##sys#compiler-toplevel-macroexpand-hook riaxpander:expand-toplevel)
  (set! ##sys#interpreter-toplevel-macroexpand-hook riaxpander:expand-toplevel)
  (set! macroexpand
        (lambda (expression . macro-environment)
          macro-environment             ;ignore -- Chicken unhygienic macros
          (riaxpander:expand-toplevel expression))))

(define (chicken/meta-evaluate expression environment)
  ((##sys#eval-handler)
   (riaxpander:expand expression environment)))

(define (chicken/compile-reference variable reference environment)
  (if (not variable)
      (name->symbol reference)
      (let ((name (variable/name variable))
            (location (variable/location variable)))
        (cond ((number? location)
               (string->symbol
                (string-append (symbol->string (name->symbol name))
                               "#"
                               (number->string location))))
              ((name? location)
               ;** Note that this strips the information necessary to
               ;** resolve hygienic module references later.
               (name->symbol location))
              (else
               (error "Variable has bogus location:"
                      variable reference environment))))))

(define current-location-uid (make-parameter 0))

(define (chicken/allocate-location environment name)
  (if (not (syntactic-environment/parent environment))
      name
      (let ((uid (current-location-uid)))
        (current-location-uid (+ uid 1))
        uid)))

(define (print-with-components type components output-port)
  ;; For some reason, the second argument to WRITE-STRING in Chicken is
  ;; false or the length of the prefix to write.
  (write-string "#<" #f output-port)
  (display type output-port)
  (for-each (lambda (component)
              (write-char #\space output-port)
              (write component output-port))
            components)
  (write-string ">" #f output-port))

(define-record-printer (<syntactic-environment> environment output-port)
  (print-with-components 'SYNTACTIC-ENVIRONMENT
                         (disclose-syntactic-environment environment)
                         output-port))

(define (printer-with-components name . component-accessors)
  (lambda (record output-port)
    (print-with-components name
                           (map (lambda (component-accessor)
                                  (component-accessor record))
                                component-accessors)
                           output-port)))

(define-record-printer <syntactic-closure>
  (printer-with-components 'SYNTACTIC-CLOSURE
                           syntactic-closure/form
                           syntactic-closure/free-names
                           (lambda (closure)
                             (disclose-syntactic-environment
                              (syntactic-closure/environment closure)))))

(define-record-printer <classifier>
  (printer-with-components 'CLASSIFIER classifier/name))

(define-record-printer <transformer>
  (printer-with-components 'TRANSFORMER))

(define-record-printer <variable>
  (printer-with-components 'VARIABLE
                           variable/name
                           variable/location))

(define-record-printer <keyword>
  (printer-with-components 'KEYWORD keyword/name))

;++ Should these actually compile the data?  The output might be more readable.

(define-record-printer <expression>
  (printer-with-components 'EXPRESSION expression/compiler))

(define-record-printer <location>
  (printer-with-components 'LOCATION location/expression-compiler))

(define-record-printer <sequence>
  (printer-with-components 'SEQUENCE sequence/forms))

(define-record-printer <definition>
  (printer-with-components 'DEFINITION))

(define-record-printer <binding>
  (printer-with-components 'BINDING binding/variable))

(define (make-chicken-environment)
  (let ((environment
         (make-syntactic-environment chicken/syntactic-operations
                                     chicken/syntactic-parameters
                                     #f
                                     '())))
    (apply-macrology (chicken-macrology) environment)
    environment))

(define (chicken-macrology)
  (compose-macrologies
   (macrology/standard-assignment)
   (macrology/standard-conditional chicken/compile-conditional)
   (macrology/standard-definition)
   (macrology/standard-derived-syntax)
   (macrology/standard-keyword-definition)
   (macrology/standard-lambda chicken/compile-lambda chicken/map-lambda-bvl)
   (macrology/standard-quotation chicken/compile-quotation)
   (macrology/standard-sequence)
   (macrology/standard-syntactic-binding)
   (macrology/syntax-rules)
   (chicken-extensions-macrology)))

(define chicken/syntactic-operations
  (let ()
    (define (global-bindings environment)
      (syntactic-environment/data environment))
    (define (set-global-bindings! environment bindings)
      (set-syntactic-environment/data! environment bindings))
    (make-syntactic-operations
     (lambda (environment name)         ;lookup
       (cond ((assq name (global-bindings environment))
              => cdr)
             ((syntactic-closure? name)
              (syntactic-lookup (syntactic-closure/environment name)
                                (syntactic-closure/form name)))
             (else #f)))
     (lambda (environment name denotation) ;bind!
       (set-global-bindings! environment
                             (cons (cons name denotation)
                                   (global-bindings environment))))
     (lambda (environment)              ;seal!
       environment ;ignore
       (if #f #f))
     (lambda (environment name)         ;alias
       environment ;ignore
       name)
     (lambda (environment)              ;disclose
       environment ;ignore
       '(CHICKEN))
     (lambda (environment procedure)    ;for-each-binding
       (for-each (lambda (binding)
                   (procedure (car binding) (cdr binding) environment))
                 (global-bindings environment))))))

(define chicken/syntactic-parameters
  (lambda (key)
    (cond ((eq? key variable-classifier) chicken/classify-variable)
          ((eq? key free-variable-classifier) chicken/classify-free-variable)
          ((eq? key combination-classifier) chicken/classify-combination)
          ((eq? key datum-classifier) chicken/classify-datum)
          ((eq? key self-evaluating?) chicken/self-evaluating?)
          ((eq? key location-allocator) chicken/allocate-location)
          ((eq? key meta-evaluator) chicken/meta-evaluate)
          (else #f))))

;;;; Miscellaneous Chicken Extensions

(define-record-type <declaration>
    (make-declaration forms environment)
    declaration?
  (forms declaration/forms)
  (environment declaration/environment))

(define-record-printer (<declaration> declaration output-port)
  (print-with-components 'DECLARATION
                         (declaration/forms declaration)
                         output-port))

(define (make-declaration-definition selector forms environment history)
  selector history                      ;ignore
  (make-definition
   (lambda (definition-environment)
     definition-environment             ;ignore
     (list (make-declaration forms environment)))))

(define (chicken/compile-declaration declaration)
  ;++ Can any Chicken declarations affect local variables?  If so, this
  ;++ needs to go through the list of forms to rename any references to
  ;++ them.  (This is why we include the environment.)
  `(DECLARE ,@(declaration/forms declaration)))

(define (chicken-extensions-macrology)
  (compose-macrologies
   (macrology/non-standard-macro-transformers)
   (macrology/syntax-quote 'SYNTAX-QUOTE chicken/compile-quotation)
   (make-extended-classifier-macrology
    (lambda (define-classifier)
      (define-classifier '(DECLARE + (NAME * DATUM))
        (lambda (form environment history)
          (values (make-declaration-definition cdr-selector
                                               (cdr form)
                                               environment
                                               history)
                  history)))))))

(define (chicken/record-source?)
  (and ##sys#line-number-database #t))

(define (chicken/clobber-source-record input-form output-form)
  (let ((input-operator (car input-form))
        (output-operator (car output-form)))
    (define (original-bucket)
      (##sys#hash-table-ref ##sys#line-number-database input-operator))
    (cond ((eq? input-operator output-operator)
           (cond ((assq input-form (or (original-bucket) '()))
                  => (lambda (cell)
                       (set-cdr! cell output-form)))))
          ((get-line-number input-form)
           => (lambda (line)
                (##sys#hash-table-set!
                 ##sys#line-number-database
                 output-operator
                 (cons (cons output-form line) (original-bucket))))))))

(define (chicken/classify-datum datum environment history)
  environment                           ;ignore
  (if (chicken/self-evaluating? datum)
      (values (make-expression (lambda () datum)) history)
      (classify-error "Inevaluable datum:" history datum)))

(define (chicken/self-evaluating? datum)
  (or (boolean? datum)
      (char? datum)
      (number? datum)
      (string? datum)
      (eof-object? datum)))

(define (chicken/classify-variable variable reference environment history)
  (values
   (make-location
    (lambda () (chicken/compile-reference variable reference environment))
    (lambda (expression assignment-history)
      assignment-history                ;ignore
      `(SET! ,(chicken/compile-reference variable reference environment)
             ,(chicken/compile-expression expression))))
   history))

(define (chicken/classify-free-variable reference environment history)
  (chicken/classify-variable #f reference environment history))

(define (chicken/classify-combination operator operator-history
                                      selector forms environment history)
  (cond ((not (expression? operator))
         (classify-error "Non-expression in operator position of combination:"
                         operator-history
                         operator))
        ((not (list? forms))
         (classify-error "Invalid operands in combination -- improper list:"
                         history
                         forms))
        (else
         (values (chicken/make-combination-location operator selector forms
                                                    environment history)
                 history))))

(define (chicken/make-combination-location operator selector forms
                                           environment history)
  (let ((classify-operands
         (lambda ()
           (classify-subexpressions selector forms environment history))))
    (make-location
     (lambda ()
       (chicken/compile-combination
        (chicken/compile-expression operator)
        (chicken/compile-expressions (classify-operands))
        history))
     (lambda (expression assignment-history)
       (chicken/compile-combination
        `(##SYS#SETTER ,(chicken/compile-expression operator))
        (chicken/compile-expressions
         (append (classify-operands) (list expression)))
        assignment-history)))))

(define (chicken/compile-quotation datum history)
  history                               ;ignore
  (if (chicken/self-evaluating? datum)
      datum
      `',datum))

(define (chicken/compile-conditional condition consequent alternative history)
  history                               ;ignore
  `(IF ,(chicken/compile-expression condition)
       ,(chicken/compile-expression consequent)
       ,@(if alternative
             `(,(chicken/compile-expression alternative))
             '())))

(define (chicken/compile-lambda bvl body environment history)
  history                               ;ignore
  `(LAMBDA ,(chicken/%map-lambda-bvl bvl
              (lambda (variable)
                (chicken/compile-reference variable #f environment)))
     ,@(chicken/compile-lambda-body body)))

(define (chicken/compile-lambda-body body)
  (receive (definitions expressions) (classify/sequence scan-r6rs-body body)
    `(,@(map (lambda (item)
               (cond ((binding? item) (chicken/compile-binding item))
                     ((declaration? item) (chicken/compile-declaration item))
                     (else (error "Invalid item in body:" item))))
             definitions)
      ,@(map chicken/compile-expression expressions))))

;;; DSSSL extended BVLs should be handled in a macro defined elsewhere.

(define (chicken/map-lambda-bvl bvl history procedure)
  (if (not (chicken/valid-bvl? bvl))
      (syntax-error "Invalid lambda BVL:" history bvl)
      (chicken/%map-lambda-bvl bvl procedure)))

(define (chicken/valid-bvl? bvl)
  (let loop ((bvl bvl) (seen '()))
    (cond ((pair? bvl)
           (and (name? (car bvl))
                (not (memq (car bvl) seen))
                (loop (cdr bvl) (cons (car bvl) seen))))
          ((null? bvl)
           #t)
          (else
           (and (name? bvl)
                (not (memq bvl seen)))))))

(define (chicken/%map-lambda-bvl bvl procedure)
  (let recur ((bvl bvl))
    (cond ((pair? bvl)
           (cons (procedure (car bvl))
                 (recur (cdr bvl))))
          ((null? bvl)
           '())
          (else
           (procedure bvl)))))

;;;; Compilation Utilities

(define (chicken/compile-expression expression)
  (cond ((location? expression)
         ((location/expression-compiler expression)))
        ((sequence? expression)
         (chicken/compile-sequence
          (classify/sequence scan-expressions expression)
          (sequence/history expression)))
        (else
         ((expression/compiler expression)))))

(define (chicken/compile-expressions expressions)
  (map chicken/compile-expression expressions))

(define (chicken/compile-combination operator operands history)
  (let ((output-form `(,operator ,@operands)))
    (cond ((and (symbol? operator)
                history
                (chicken/record-source?)
                (find (lambda (reduction)
                        (let ((form (reduction/form reduction)))
                          (and (pair? form)
                               (symbol? (car form)))))
                      (reverse (history/reductions history))))
           => (lambda (reduction)
                (chicken/clobber-source-record (reduction/form reduction)
                                               output-form))))
    output-form))

(define (chicken/compile-binding binding)
  `(DEFINE ,(chicken/compile-reference (binding/variable binding)
                                       #f
                                       (binding/environment binding))
     ,(receive (expression history) ((binding/classifier binding))
        history                         ;ignore
        (chicken/compile-expression expression))))

(define (chicken/compile-sequence expressions history)
  history                               ;ignore
  `(BEGIN ,@(chicken/compile-expressions expressions)))
