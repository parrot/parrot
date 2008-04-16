;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; S-Expression Client

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

(define (sexp/expand form environment)
  (sexp/expand* (list form) environment))

(define (sexp/expand* forms environment)
  ((lambda (body)                       ;++ Use a proper fluid cell.
     (let ((uid *location-uid*))
       (set! *location-uid* 0)
       (let ((value (body)))
         (set! *location-uid* uid)
         value)))
   (lambda ()
     ((lambda (results)
        (if (and (pair? results)
                 (null? (cdr results)))
            (car results)
            `(BEGIN ,@results)))
      (map (lambda (item)
             (cond ((binding? item) (sexp/compile-binding item))
                   ((expression? item) (sexp/compile-expression item))
                   (else (error "Invalid item in output:" item))))
           (scan-top-level identity-selector
                           forms
                           environment
                           (make-top-level-history forms environment)))))))

(define (sexp/meta-evaluate expression environment)
  ;; ENVIRONMENT is a syntactic environment, not an R5RS environment
  ;; specifier (or `evaluation environment', perhaps), and is
  ;; therefore unsuitable as an argument to EVAL.
  (eval (sexp/expand expression environment) (interaction-environment)))

(define (sexp/compile-reference variable reference environment)
  (if (not variable)
      (name->symbol reference)
      (let ((name (variable/name variable))
            (location (variable/location variable)))
        (cond ((number? location)
               (string->symbol
                (string-append (symbol->string (name->symbol name))
                               "#"
                               (number->string location #d10))))
              ((name? location)
               ;** Note that this strips the information necessary to
               ;** resolve hygienic module references later.
               (name->symbol location))
              (else
               (error "Variable has bogus location:"
                      variable reference environment))))))

(define *location-uid* 0)

(define (sexp/allocate-location environment name)
  (if (not (syntactic-environment/parent environment))
      name
      (let ((uid *location-uid*))
        (set! *location-uid* (+ uid 1))
        uid)))

;;;; S-Expression Syntactic Environment

(define (make-sexp-environment)
  (let ((environment
         (make-syntactic-environment sexp/syntactic-operations
                                     sexp/syntactic-parameters
                                     #f
                                     '())))
    (apply-macrology (sexp/macrology) environment)
    environment))

(define (sexp/macrology)
  (compose-macrologies                  ;Alphabetically listed, for no reason.
   (macrology/standard-assignment)
   (macrology/standard-conditional sexp/compile-conditional)
   (macrology/standard-definition)
   (macrology/standard-derived-syntax)
   (macrology/standard-keyword-definition)
   (macrology/standard-lambda sexp/compile-lambda sexp/map-lambda-bvl)
   (macrology/standard-quotation sexp/compile-quotation)
   (macrology/standard-sequence)
   (macrology/standard-syntactic-binding)
   (macrology/syntax-quote 'SYNTAX-QUOTE sexp/compile-quotation)
   (macrology/non-standard-macro-transformers)
   (macrology/syntax-rules)))

(define sexp/syntactic-operations
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
       '(SEXP))
     (lambda (environment procedure)    ;for-each-binding
       (for-each (lambda (binding)
                   (procedure (car binding) (cdr binding) environment))
                 (global-bindings environment))))))

(define sexp/syntactic-parameters
  (lambda (key)
    (cond ((eq? key variable-classifier) sexp/classify-variable)
          ((eq? key free-variable-classifier) sexp/classify-free-variable)
          ((eq? key datum-classifier) sexp/classify-datum)
          ((eq? key self-evaluating?) sexp/self-evaluating?)
          ((eq? key combination-classifier) sexp/classify-combination)
          ((eq? key location-allocator) sexp/allocate-location)
          ((eq? key meta-evaluator) sexp/meta-evaluate)
          (else #f))))

;;;;; S-Expression Syntactic Parameters

(define (sexp/classify-datum datum environment history)
  environment                           ;ignore
  (if (sexp/self-evaluating? datum)
      (values (make-expression (lambda () datum)) history)
      (classify-error "Inevaluable datum:" history datum)))

(define (sexp/self-evaluating? datum)
  (or (boolean? datum)
      (char? datum)
      (number? datum)
      (string? datum)))

(define (sexp/classify-variable variable reference environment history)
  (values
   (make-location
    (lambda () (sexp/compile-reference variable reference environment))
    (lambda (expression assignment-history)
      assignment-history                ;ignore
      `(SET! ,(sexp/compile-reference variable reference environment)
             ,(sexp/compile-expression expression))))
   history))

(define (sexp/classify-free-variable reference environment history)
  (sexp/classify-variable #f reference environment history))

(define (sexp/classify-combination operator operator-history
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
         (values
          (make-expression
           (lambda ()
             (sexp/compile-combination
              operator
              (classify-subexpressions selector forms environment history)
              history)))
          history))))

;;;;; S-Expression Compilers

(define (sexp/compile-quotation datum history)
  history                               ;ignore
  (if (sexp/self-evaluating? datum)
      datum
      `',datum))

(define (sexp/compile-conditional condition consequent alternative history)
  history                               ;ignore
  `(IF ,(sexp/compile-expression condition)
       ,(sexp/compile-expression consequent)
       ,@(if alternative
             `(,(sexp/compile-expression alternative))
             '())))

(define (sexp/compile-lambda bvl body environment history)
  history                               ;ignore
  `(LAMBDA ,(sexp/%map-lambda-bvl bvl
              (lambda (variable)
                (sexp/compile-reference variable #f environment)))
     ,@(sexp/compile-lambda-body body)))

(define (sexp/compile-lambda-body body)
  (receive (bindings expressions)
           (classify/sequence scan-r5rs-body body)
    `(,@(map sexp/compile-binding bindings)
      ,@(map sexp/compile-expression expressions))))

(define (sexp/map-lambda-bvl bvl history procedure)
  (sexp/%map-lambda-bvl (sexp/guarantee-lambda-bvl bvl history) procedure))

(define (sexp/%map-lambda-bvl bvl procedure)
  (let recur ((bvl bvl))
    (cond ((pair? bvl)
           (cons (procedure (car bvl))
                 (recur (cdr bvl))))
          ((null? bvl)
           '())
          (else
           (procedure bvl)))))

(define (sexp/guarantee-lambda-bvl bvl history)
  (define (lose)
    (receive (bvl history)
             (syntax-error "Malformed lambda bound variable list:" history bvl)
      (sexp/guarantee-lambda-bvl bvl history)))
  (let ((original-bvl bvl))
    (let loop ((bvl bvl) (seen '()))
      (cond ((pair? bvl)
             (if (and (name? (car bvl))
                      (not (memq (car bvl) seen)))
                 (loop (cdr bvl) (cons (car bvl) seen))
                 (lose)))
            ((or (null? bvl)
                 (and (name? bvl)
                      (not (memq bvl seen))))
             original-bvl)
            (else
             (lose))))))

;;;;; S-Expression Compilation Utilities

(define (sexp/compile-expression expression)
  (cond ((location? expression)
         ((location/expression-compiler expression)))
        ((sequence? expression)
         (sexp/compile-sequence (classify/sequence scan-expressions expression)
                                (sequence/history expression)))
        (else
         ((expression/compiler expression)))))

(define (sexp/compile-expressions expressions)
  (map sexp/compile-expression expressions))

(define (sexp/compile-combination operator operands history)
  history                               ;ignore
  `(,(sexp/compile-expression operator) ,@(sexp/compile-expressions operands)))

(define (sexp/compile-binding binding)
  `(DEFINE ,(sexp/compile-reference (binding/variable binding)
                                    #f
                                    (binding/environment binding))
     ,(receive (expression history) ((binding/classifier binding))
        history                         ;ignore
        (sexp/compile-expression expression))))

(define (sexp/compile-sequence expressions history)
  history                               ;ignore
  `(BEGIN ,@(map sexp/compile-expression expressions)))
