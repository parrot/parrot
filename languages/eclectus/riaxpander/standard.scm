;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; Macrologies for Standard Syntax

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

(define (macrology/standard-derived-syntax)
  (compose-macrologies
   (macrology/standard-variable-binding)
   (macrology/standard-boolean-connectives)
   (macrology/standard-iteration)
   (macrology/standard-derived-conditional)
   (macrology/standard-quasiquote)))

(define (make-extended-classifier-macrology receiver)
  (make-classifier-macrology
   (lambda (*define-classifier)
     (define (define-classifier pattern procedure)
       (*define-classifier (car pattern)
         (let ((predicate (pattern-predicate `(KEYWORD ,@(cdr pattern)))))
           (lambda (form environment history)
             (if (predicate form
                            (lambda (name) name)
                            (make-name-comparator environment))
                 (procedure form environment history)
                 (classify-error "Invalid syntax:" history form))))))
     (receiver define-classifier))))

(define (make-expression-compiler-macrology receiver)
  (make-extended-classifier-macrology
   (lambda (define-classifier)
     (define (define-expression-compiler pattern procedure)
       (define-classifier pattern
         (lambda (form environment history)
           (values (make-expression (lambda ()
                                      (procedure form environment history)))
                   history))))
     (receiver define-expression-compiler))))

(define (make-extended-er-macro-transformer-macrology receiver)
  (make-er-macro-transformer-macrology
   (lambda (*define-transformer)
     (define (define-transformer pattern procedure auxiliary-names)
       (*define-transformer (car pattern)
         (let ((predicate (pattern-predicate `(KEYWORD ,@(cdr pattern)))))
           (lambda (form rename compare)
             (if (predicate form rename compare)
                 (procedure form rename compare)
                 form)))
         auxiliary-names))
     (receiver define-transformer))))

(define (define-expression-compiler-macrology pattern procedure)
  (make-expression-compiler-macrology
   (lambda (define-expression-compiler)
     (define-expression-compiler pattern procedure))))

;;;; Rudimentary Syntax Pattern Checking

;;; This pattern predicate mechanism is not for use outside this file.
;;; Please use a real pattern matcher instead.

;++ Improvement:  Record the position of the subexpression
;++ that went wrong, and report that in the syntax error.

(define (pattern-predicate pattern)
  (cond ((pair? pattern)
         (case (car pattern)
           ((@)
            (if (and (pair? (cdr pattern))
                     (string? (cadr pattern))
                     (pair? (cddr pattern))
                     (null? (cdddr pattern)))
                (pattern/annotated (cadr pattern)
                                   (pattern-predicate (caddr pattern)))
                (pattern-error pattern)))
           ((? * +)
            (if (pair? (cdr pattern))
                ((case (car pattern)
                   ((?) (repeating-pattern 0 1))
                   ((*) (repeating-pattern 0 #f))
                   ((+) (repeating-pattern 1 #f)))
                 (pattern-predicate (cadr pattern))
                 (pattern-predicate (cddr pattern)))
                (pattern-error pattern)))
           ((NOT)
            (if (and (pair? (cdr pattern))
                     (null? (cddr pattern)))
                (pattern/complement (cadr pattern))
                (pattern-error pattern)))
           ((AND)
            (pattern/conjunction (map pattern-predicate (cdr pattern))))
           ((OR)
            (pattern/disjunction (map pattern-predicate (cdr pattern))))
           ((QUOTE)
            (if (and (pair? (cdr pattern))
                     (null? (cddr pattern)))
                (pattern/literal (cadr pattern))
                (pattern-error pattern)))
           (else
            (pattern/pair (pattern-predicate (car pattern))
                          (pattern-predicate (cdr pattern))))))
        ((symbol? pattern)
         (case pattern
           ((NAME)
            (pattern/predicate name?))
           ((SYMBOL)
            (pattern/predicate symbol?))
           ((DATUM FORM KEYWORD BVL EXPRESSION LOCATION)    ;Plugh...
            (pattern/variable))
           (else
            (pattern/literal pattern))))
        ((procedure? pattern)
         pattern)
        (else
         (pattern/literal pattern))))

(define (pattern-error pattern)
  (error "Malformed pattern:" pattern))

(define (test-pattern pattern form)
  ((pattern-predicate pattern) form (lambda (x) x) eq?))

(define (pattern/variable)
  (lambda (form rename compare)
    form rename compare                 ;ignore
    #t))

(define (pattern/annotated annotation predicate)
  annotation                            ;ignore
  predicate)

(define (pattern/predicate procedure)
  (lambda (form rename compare)
    rename compare                      ;ignore
    (procedure form)))

(define (pattern/complement predicate)
  (lambda (form rename compare)
    (not (predicate form rename compare))))

(define (pattern/literal datum)
  (if (name? datum)
      (lambda (form rename compare)
        (compare form (rename datum)))
      (lambda (form rename compare)
        rename compare                  ;ignore
        (eqv? form datum))))

(define (pattern/pair car-predicate cdr-predicate)
  (lambda (form rename compare)
    (and (pair? form)
         (car-predicate (car form) rename compare)
         (cdr-predicate (cdr form) rename compare))))

(define (pattern/conjunction conjuncts)
  (lambda (form rename compare)
    (let loop ((conjuncts conjuncts))
      (or (not (pair? conjuncts))
          (and ((car conjuncts) form rename compare)
               (loop (cdr conjuncts)))))))

(define (pattern/disjunction disjuncts)
  (lambda (form rename compare)
    (let loop ((disjuncts disjuncts))
      (and (pair? disjuncts)
           (or ((car disjuncts) form rename compare)
               (loop (cdr disjuncts)))))))

(define (repeating-pattern lower upper)
  (lambda (element-predicate tail-predicate)
    (lambda (form rename compare)
      (define (element? form)
        (element-predicate form rename compare))
      (define (tail? form)
        (tail-predicate form rename compare))
      (let loop ((form form) (count 0))
        (cond ((and upper (= count upper))
               (tail? form))
              ((not (pair? form))
               (and (>= count lower)
                    (tail? form)))
              ((element? (car form))
               (loop (cdr form) (+ count 1)))
              ((>= count lower)
               (tail? form))
              (else #f))))))

;;;; Standard Primitive Syntax

(define (macrology/standard-assignment)
  (define-expression-compiler-macrology '(SET! LOCATION EXPRESSION)
    (lambda (form environment history)
      (define (subform classifier selector cxr)
        (receive (classification history)
            (classifier selector (cxr form) environment history)
          history                       ;ignore
          classification))
      ((location/assignment-compiler
        (subform classify-sublocation cadr-selector cadr))
       (subform classify-subexpression caddr-selector caddr)
       history))))

(define (macrology/standard-conditional compiler)
  (define-expression-compiler-macrology '(IF EXPRESSION
                                             EXPRESSION
                                             ? EXPRESSION)
    (lambda (form environment history)
      (define (subexpression selector cxr)
        (receive (expression history)
            (classify-subexpression selector (cxr form) environment history)
          history                       ;ignore
          expression))
      (let ((condition (subexpression cadr-selector cadr))
            (consequent (subexpression caddr-selector caddr))
            (alternative
             (and (pair? (cdddr form))
                  (subexpression cadddr-selector cadddr))))
        (compiler condition consequent alternative history)))))

(define (macrology/standard-lambda compiler lambda-bvl-mapper)
  (define-expression-compiler-macrology '(LAMBDA BVL + FORM)
    (lambda (form environment history)
      (let* ((environment* (syntactic-extend environment))
             (bvl*
              (let ((bvl (cadr form)))
                (lambda-bvl-mapper
                 bvl
                 (history/add-subform history cadr-selector bvl environment)
                 (lambda (name)
                   (bind-variable! name environment*))))))
        (syntactic-seal! environment*)
        (compiler bvl*
                  (make-sequence cddr-selector
                                 (cddr form)
                                 (syntactic-extend environment*)
                                 history)
                  environment*
                  history)))))

(define (macrology/standard-quotation compiler)
  (define-expression-compiler-macrology '(QUOTE DATUM)
    (lambda (form environment history)
      environment                       ;ignore
      (compiler (syntax->datum (cadr form)) history))))

(define (macrology/standard-sequence)
  (make-extended-classifier-macrology
   (lambda (define-classifier)
     (define-classifier '(BEGIN * FORM)
       (lambda (form environment history)
         (classify-sequence cdr-selector (cdr form) environment history))))))

;;;; Definition Syntax

(define (macrology/standard-keyword-definition)
  (make-extended-classifier-macrology
   (lambda (define-classifier)
     (define-classifier '(DEFINE-SYNTAX NAME FORM)
       (lambda (form environment history)
         (values (make-keyword-definition cadr-selector (cadr form)
                                          caddr-selector (caddr form)
                                          environment history)
                 history))))))

(define (macrology/standard-definition)
  (make-definition-macrology standard-definition-pattern
                             make-variable-definition))

(define (macrology/curried-definition)
  (make-definition-macrology curried-definition-pattern
                             make-variable-definition))

(define (macrology/overloaded-definition)
  (make-definition-macrology curried-definition-pattern
                             make-overloaded-definition))

(define standard-definition-pattern
  '(DEFINE . (OR (NAME EXPRESSION) ((NAME . BVL) + FORM))))

(define curried-definition-pattern
  (letrec ((curried?
            (pattern-predicate
             `((OR NAME
                   ,(lambda (form rename compare)
                      (curried? form rename compare)))
               . BVL))))
    `(DEFINE . (OR (NAME EXPRESSION) (,curried? + FORM)))))

(define (make-definition-macrology pattern make-definition)
  (make-extended-er-macro-transformer-macrology
   (lambda (define-transformer)
     (define-transformer pattern
       (let ((definition-operator (make-definition-operator make-definition)))
         (lambda (form rename compare)
           compare                      ;ignore
           (if (name? (cadr form))
               (let ((name (cadr form))
                     (expression (caddr form)))
                 `(,definition-operator ,name ,expression))
               (let ((define (car form))
                     (name (caadr form))
                     (lambda (rename 'LAMBDA))
                     (bvl (cdadr form))
                     (body (cddr form)))
                 `(,define ,name (,lambda ,bvl ,@body))))))
       '(LAMBDA)))))

(define (make-definition-operator make-definition)
  (classifier->operator
   (lambda (form environment history)
     (values (make-definition cadr-selector (cadr form)
                              caddr-selector (caddr form)
                              environment history)
             history))))

;;;; Local Syntactic Bindings: LET-SYNTAX & LETREC-SYNTAX

;;; This does not implement R5RS semantics, which requires that the
;;; body consist only of expressions.  This does, however, implement
;;; R6RS semantics, and, much as I am opposed to R6RS, I prefer its
;;; LET-SYNTAX semantics.  If one wishes to introduce a new scope, one
;;; can write the LET explicitly.  Implementing R5RS semantics is more
;;; trouble than it's worth to do correctly.

(define (macrology/standard-syntactic-binding)
  (make-extended-classifier-macrology
   (lambda (define-classifier)

     (define (local-syntax form environment enclosing-environment history)
       (select-for-each cadr-selector (cadr form)
         (lambda (selector binding)
           (receive (keyword history)
               (classify-subkeyword (select-car (select-cdr selector))
                                    (cadr binding)
                                    enclosing-environment
                                    history)
             history                    ;ignore
             (syntactic-bind! environment
                              (car binding)
                              (keyword/denotation keyword)))))
       (syntactic-seal! environment)
       (classify-sequence cddr-selector (cddr form) environment history))

     (define-classifier '(LET-SYNTAX (* (@ "LET-SYNTAX binding"
                                           (NAME EXPRESSION)))
                           + FORM)
       (lambda (form enclosing-environment history)
         (let ((environment (syntactic-splicing-extend enclosing-environment)))
           (local-syntax form environment enclosing-environment history))))

     (define-classifier '(LETREC-SYNTAX (* (@ "LETREC-SYNTAX binding"
                                              (NAME EXPRESSION)))
                           + FORM)
       (lambda (form enclosing-environment history)
         (let ((environment (syntactic-splicing-extend enclosing-environment)))
           (local-syntax form environment environment history)))))))

;;;; Local Variable Bindings: LET, LET*, & LETREC

(define (macrology/standard-variable-binding)
  (make-extended-er-macro-transformer-macrology
   (lambda (define-transformer)

     (define-transformer '(LET . DATUM)   ;Dummy pattern.
       (let ((unnamed-let? (pattern-predicate '((* (NAME EXPRESSION)) + FORM)))
             (named-let?
              (pattern-predicate '(NAME (* (NAME EXPRESSION)) + FORM))))
         (lambda (form rename compare)
           (cond ((unnamed-let? (cdr form) rename compare)
                  (let ((bindings (cadr form))
                        (body (cddr form)))
                    (let ((variables (map car bindings))
                          (initializers (map cadr bindings)))
                      `((,(rename 'LAMBDA) ,variables ,@body)
                        ,@initializers))))
                 ((named-let? (cdr form) rename compare)
                  (let ((name (cadr form))
                        (bindings (caddr form))
                        (body (cdddr form)))
                    (let ((variables (map car bindings))
                          (initializers (map cadr bindings)))
                      `((,(rename 'LET) ()
                          (,(rename 'DEFINE) (,name ,@variables)
                            ,@body)
                          ,name)
                        ,@initializers))))
                 (else form))))
       '(DEFINE LAMBDA LET))

     (define-transformer '(LET* (* (@ "LET* binding" (NAME EXPRESSION)))
                            + FORM)
       (lambda (form rename compare)
         compare                        ;ignore
         (let ((clauses (cadr form))
               (body (cddr form)))
           (if (not (pair? clauses))
               `(,(rename 'LET) () ,@body)
               (let recur ((clauses clauses))
                 (let ((clause (car clauses))
                       (clauses (cdr clauses)))
                   `(,(rename 'LET) (,clause)
                      ,@(if (pair? clauses)
                            `(,(recur clauses))
                            body)))))))
       '(LET))

     (define-transformer '(LETREC (* (@ "LETREC binding" (NAME EXPRESSION)))
                            + FORM)
       (lambda (form rename compare)
         compare                        ;ignore
         (let ((bindings (cadr form))
               (body (cddr form)))
           `(,(rename 'LET) ()
              ,@(map (lambda (binding)
                       (let ((variable (car binding))
                             (initializer (cadr binding)))
                         `(,(rename 'DEFINE) ,variable ,initializer)))
                     bindings)
              (,(rename 'LET) ()
                ,@body))))
       '(DEFINE LET)))))

;;;; Standard Derived Syntax

(define (macrology/standard-boolean-connectives)
  (make-extended-er-macro-transformer-macrology
   (lambda (define-transformer)

     (define (boolean-reduction identity binary-case)
       (lambda (form rename compare)
         compare                        ;ignore
         (let ((operands (cdr form)))
           (cond ((not (pair? operands))
                  identity)
                 ((not (pair? (cdr operands)))
                  (car operands))
                 (else
                  (binary-case rename
                               (car operands)
                               `(,(car form) ,@(cdr operands))))))))

     (define-transformer '(AND * EXPRESSION)
       (boolean-reduction '#T
                          (lambda (rename a b)
                            `(,(rename 'IF) ,a ,b #F)))
       '(IF))

     (define-transformer '(OR * EXPRESSION)
       (boolean-reduction '#F
                          (lambda (rename a b)
                            `(,(rename 'LET) ((,(rename 'T) ,a))
                               (,(rename 'IF) ,(rename 'T)
                                 ,(rename 'T)
                                 ,b))))
       '(LET IF)))))

(define (macrology/standard-iteration)
  (make-extended-er-macro-transformer-macrology
   (lambda (define-transformer)
     (define-transformer
         '(DO (* (@ "DO variable clause" (NAME EXPRESSION ? EXPRESSION)))
              (@ "DO return clause" (EXPRESSION ? EXPRESSION))
            * FORM)
       (lambda (form rename compare)
         compare                        ;ignore
         (let ((bindings (cadr form))
               (condition (car (caddr form)))
               (result (cdr (caddr form)))
               (body (cdddr form)))
           (let ((loop-variables
                  (map (lambda (binding)
                         `(,(car binding) ,(cadr binding)))
                       bindings))
                 (loop-updates
                  (map (lambda (binding)
                         (if (null? (cddr binding))
                             (car binding)
                             (caddr binding)))
                       bindings)))
             `(,(rename 'LET) ,(rename 'DO-LOOP) (,@loop-variables)
                (,(rename 'IF) ,condition
                  (,(rename 'IF) #F #F ,@result)
                  (,(rename 'BEGIN)
                    ,@body
                    (,(rename 'DO-LOOP) ,@loop-updates)))))))
       '(BEGIN IF LET)))))

;;;;; Standard Derived Conditional Syntax: COND & CASE

(define (macrology/standard-derived-conditional)
  (make-extended-er-macro-transformer-macrology
   (lambda (define-transformer)

     ;;; This supports the SRFI 61 extension to `=>' clauses.

     (define-transformer '(COND + (@ "COND clause" (+ EXPRESSION)))
       (let ((else-clause? (pattern-predicate '('ELSE + EXPRESSION)))
             (or-clause? (pattern-predicate '(EXPRESSION)))
             (=>-clause? (pattern-predicate '(EXPRESSION '=> EXPRESSION)))
             (=>*-clause?
              (pattern-predicate '(EXPRESSION EXPRESSION '=> EXPRESSION))))
         (lambda (form rename compare)
           (call-with-syntax-error-procedure
             (lambda (syntax-error)
               (let recur ((selector cdr-selector) (clauses (cdr form)))
                 (let ((clause (car clauses))
                       (clauses* (cdr clauses))
                       (selector* (select-cdr selector)))
                   (define (more?) (pair? clauses*))
                   (define (more) (recur selector* clauses*))
                   (define (maybe-more) (if (more?) `(,(more)) '()))
                   (cond ((else-clause? clause rename compare)
                          (if (more?)
                              (syntax-error "COND clauses after ELSE:"
                                            selector*
                                            clauses*)
                              (let ((body (cdr clause)))
                                ;; Tricky pedantic case to prevent
                                ;; internal definitions at all costs.
                                `(,(rename 'IF) #T
                                   (,(rename 'BEGIN) ,@body)))))
                         ((or-clause? clause rename compare)
                          (let ((expression (car clause)))
                            (if (more?)
                                `(,(rename 'OR) ,expression ,(more))
                                ;; More pedantic tricks.
                                `(,(rename 'IF) #T
                                   ,expression))))
                         ((=>-clause? clause rename compare)
                          (let ((producer (car clause))
                                (consumer (caddr clause)))
                            `(,(rename 'LET) ((,(rename 'T) ,producer))
                               (,(rename 'IF) ,(rename 'T)
                                 (,consumer ,(rename 'T))
                                 ,@(maybe-more)))))
                         ((=>*-clause? clause rename compare)
                          (let ((producer (car clause))
                                (tester (caddr clause))
                                (consumer (cadddr clause)))
                            `(,(rename 'LET) ((,(rename 'T) ,producer))
                               (,(rename 'IF)
                                   (,(rename 'APPLY) ,tester ,(rename 'T))
                                 (,(rename 'APPLY) ,consumer ,(rename 'T))
                                 ,@(maybe-more)))))
                         (else
                          (let ((condition (car clause))
                                (body (cdr clause)))
                            `(,(rename 'IF) ,condition
                               (,(rename 'BEGIN) ,@body)
                               ,@(maybe-more)))))))))))
       '(APPLY BEGIN IF LET OR))

     ;;; (DEFINE (MACROLOGY/STANDARD-DERIVED-CONDITIONAL) ...), continued

     (define-transformer '(CASE EXPRESSION + (@ "CASE clause" (+ EXPRESSION)))
       (let ((else-clause? (pattern-predicate '('ELSE + EXPRESSION)))
             (case-clause? (pattern-predicate '((* DATUM) + EXPRESSION))))
         (lambda (form rename compare)
           (capture-syntax-error-procedure
             (lambda (syntax-error)
               `(,(rename 'LET) ((,(rename 'KEY) ,(cadr form)))
                  ,(let recur ((selector cddr-selector)
                               (clauses (cddr form)))
                     (let ((clause (car clauses))
                           (clauses* (cdr clauses))
                           (selector* (select-cdr selector)))
                       (define (more?) (pair? clauses*))
                       (define (more) (recur selector* clauses*))
                       (define (maybe-more) (if (more?) `(,(more)) '()))
                       (cond ((else-clause? clause rename compare)
                              (if (more?)
                                  (syntax-error "CASE clauses after ELSE:"
                                                selector*
                                                clauses*)
                                  `(,(rename 'IF) #T
                                     (,(rename 'BEGIN) ,@(cdr clause)))))
                             ((case-clause? clause rename compare)
                              (let ((data (car clause))
                                    (forms (cdr clause)))
                                `(,(rename 'IF)
                                     ,(let ((compare
                                             (lambda (datum)
                                               `(,(rename 'EQV?)
                                                 ,(rename 'KEY)
                                                 (,(rename 'QUOTE) ,datum)))))
                                        ;; Gratuitous optimization...
                                        (cond ((not (pair? data))
                                               '#F)
                                              ((not (pair? (cdr data)))
                                               (compare (car data)))
                                              (else
                                               `(,(rename 'OR)
                                                 ,@(map compare data)))))
                                   (,(rename 'BEGIN) ,@forms)
                                   ,@(maybe-more))))
                             (else
                              (syntax-error "Invalid CASE clause:"
                                            (select-car selector)
                                            clause))))))))))
       '(BEGIN EQV? IF LET QUOTE)))))

;;;;; Quasiquote

(define (macrology/standard-quasiquote)
  (make-extended-er-macro-transformer-macrology
   (lambda (define-transformer)
     ;++ This should check for misplaced uses of the keywords.
     (define quasiquote? (pattern-predicate '('QUASIQUOTE DATUM)))
     (define unquote? (pattern-predicate '('UNQUOTE DATUM)))
     (define unquote-splicing? (pattern-predicate '('UNQUOTE-SPLICING DATUM)))
     (define-transformer '(QUASIQUOTE DATUM)
       (lambda (form rename compare)
         (call-with-syntax-error-procedure
           (lambda (syntax-error)
             (define (qq-quote datum)
               (list (rename 'QUOTE) datum))
             (define (qq-cons car-expression cdr-expression)
               (list (rename 'CONS) car-expression cdr-expression))
             (define (qq-append list-expression tail-expression)
               (list (rename 'APPEND) list-expression tail-expression))
             (define (qq-list->vector list-expression)
               (list (rename 'LIST->VECTOR) list-expression))
             (define (qq-nest keyword template depth)
               (list (rename 'LIST) (qq-quote keyword) (qq template depth)))

             (define (qq template depth)
               (cond ((pair? template) (qq-pair template depth))
                     ((vector? template) (qq-vector template depth))
                     (else (qq-quote template))))

             (define (qq-pair template depth)
               (cond ((quasiquote? template rename compare)
                      (qq-nest 'QUASIQUOTE (cadr template) (+ depth 1)))
                     ((unquote? template rename compare)
                      (if (zero? depth)
                          (cadr template)
                          (qq-nest 'UNQUOTE (cadr template) (- depth 1))))
                     ((unquote-splicing? template rename compare)
                      ;++ Figure out the selector for a better report.
                      (syntax-error "Misplaced ,@ template:" template))
                     (else
                      (qq-list template depth qq))))

             (define (qq-vector template depth)
               (qq-list->vector
                (let recur ((template (vector->list template)) (depth depth))
                  (if (null? template)
                      (qq-quote '())
                      (qq-list template depth recur)))))

             (define (qq-list template depth recur)
               (let ((element (car template))
                     (tail (cdr template)))
                 (if (unquote-splicing? element rename compare)
                     (if (zero? depth)
                         (if (null? tail)
                             (cadr element)
                             (qq-append (cadr element) (qq tail depth)))
                         (qq-cons (qq-nest 'UNQUOTE-SPLICING
                                           (cadr element)
                                           (- depth 1))
                                  (recur tail depth)))
                     (qq-cons (qq element depth) (recur tail depth)))))

             (qq (cadr form) 0))))
       '(APPEND CONS LIST LIST->VECTOR QUASIQUOTE QUOTE)))))

;;;; Non-Standard Primitive Syntax

;;; The name of the form for the variant of QUOTE that does not strip
;;; syntax is not standard; there is not even a de facto standard.
;;; Scheme48 calls it CODE-QUOTE; MIT Scheme calls it SYNTAX-QUOTE.
;;; We therefore allow the name to be supplied.

(define (macrology/syntax-quote name compiler)
  (make-expression-compiler-macrology
   (lambda (define-expression-compiler)
     (define-expression-compiler `(,name DATUM)
       (lambda (form environment history)
         environment                    ;ignore
         (compiler (cadr form) history))))))

(define (macrology/non-standard-macro-transformers)
  (make-extended-classifier-macrology
   (lambda (define-classifier)

     (define (name-list? object)
       (if (pair? object)
           (and (name? (car object))
                (name-list? (cdr object)))
           (null? object)))

     (define (define-transformer-classifier name wrapper)
       (define-classifier `(,name EXPRESSION ? (* NAME))
         (lambda (form environment history)
           (let ((finish
                  (lambda (procedure auxiliary-names)
                    (values (make-keyword form
                                          (make-transformer environment
                                                            auxiliary-names
                                                            (wrapper procedure)
                                                            form))
                            history)))
                 (expression (cadr form))
                 (auxiliary-names (if (pair? (cddr form)) (caddr form) #f)))
             (let ((mumble (meta-evaluate expression environment)))
               (cond ((procedure? mumble)
                      (finish mumble auxiliary-names))
                     ((and (pair? mumble)
                           (procedure? (car mumble))
                           (name-list? (cdr mumble)))
                      (if auxiliary-names
                          (classify-error "Multiple auxiliary name lists:"
                                          history
                                          (cdr mumble)
                                          auxiliary-names)
                          (finish (car mumble) (cdr mumble))))
                     (else
                      (classify-error "Invalid transformer procedure:"
                                      history
                                      mumble))))))))

     (define-transformer-classifier 'ER-MACRO-TRANSFORMER
       make-er-macro-transformer-procedure)

     (define-transformer-classifier 'SC-MACRO-TRANSFORMER
       make-sc-macro-transformer-procedure)

     (define-transformer-classifier 'RSC-MACRO-TRANSFORMER
       make-rsc-macro-transformer-procedure))))
