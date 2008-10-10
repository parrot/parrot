; $Id$

; Generate PAST for Eclectus

;; Helpers for generating PAST

(define (make-past-conser type)
  (let ((type-symbol (string->symbol type)))
    (lambda args
      (cons type-symbol args))))

(define past::op    (make-past-conser "PAST::Op"))
(define past::val   (make-past-conser "PAST::Val"))
(define past::var   (make-past-conser "PAST::Var"))
(define past::block (make-past-conser "PAST::Block"))
(define past::stmts
  (let ((type-symbol (string->symbol "PAST::Stmts")))
    (lambda (stmts)
      (cons type-symbol stmts))))

; recognition of forms
(define make-combination-predicate
  (lambda (name)
    (lambda (form)
      (and (pair? form)
           (eq? name (car form))))))

(define if?     (make-combination-predicate 'if))
(define let?    (make-combination-predicate 'let))
(define lambda? (make-combination-predicate 'lambda))
(define begin?  (make-combination-predicate 'begin))
(define quote?  (make-combination-predicate 'quote))

(define if-test
  (lambda (form)
    (car (cdr form))))

(define if-conseq
  (lambda (form)
    (car (cdr (cdr form)))))

(define if-altern
  (lambda (form)
    (car (cdr (cdr (cdr form))))))

(define (self-evaluating? x)
  (or (string? x)
      (number? x)
      (char? x)
      (boolean? x)))

; Support for primitive functions

(define-record-type primitive
  (make-primitive arg-count emitter)
  primitive?
  (arg-count primitive-arg-count)
  (emitter primitive-emitter))

(define *primitives* (make-eq-hashtable))

(define (lookup-primitive sym)
  (hashtable-ref *primitives* sym #f))

; is x a call to a primitive? 
(define primcall?
  (lambda (x)
    (and (pair? x) (lookup-primitive (car x)))))

; implementations of primitive functions are added
; with 'define-primitive'
(define-syntax define-primitive
  (syntax-rules ()
    ((_ (prim-name arg* ...) b b* ...)
     (hashtable-set! *primitives*
                     'prim-name
                     (make-primitive (length '(arg* ...))
                                     (lambda (arg* ...) b b* ...))))))

;; arithmetic forms
(define-primitive (fxadd1 arg)
  (past::op '(@ (pirop "add"))
            (emit-expr arg)
            (emit-expr 1)))

(define-primitive (fx+ arg1 arg2)
  (past::op '(@ (pirop "add"))
            (emit-expr arg1)
            (emit-expr arg2)))

(define-primitive (fxsub1 arg)
  (past::op '(@ (pirop "sub"))
            (emit-expr arg)
            (emit-expr 1)))

(define-primitive (fx- arg1 arg2)
  (past::op '(@ (pirop "sub"))
            (emit-expr arg1)
            (emit-expr arg2)))

(define-primitive (fxlogand arg1 arg2)
  (past::op '(@ (pirop "band"))
            (emit-expr arg1)
            (emit-expr arg2)))

(define-primitive (fxlogor arg1 arg2)
  (past::op '(@ (pirop "bor"))
            (emit-expr arg1)
            (emit-expr arg2)))

(define-primitive (char->fixnum arg)
  (past::op '(@ (pasttype "inline")
                (inline "new %r, 'EclectusFixnum'\\nassign %r, %0\\n"))
            (emit-expr arg)))

(define-primitive (fixnum->char arg)
  (past::op '(@ (pasttype "inline")
                (inline "new %r, 'EclectusCharacter'\\nassign %r, %0\\n"))
            (emit-expr arg)))

;; list forms
(define-primitive (cons arg1 arg2)
  (past::op '(@ (pasttype "inline")
                (inline "new %r, 'EclectusPair'\\nset %r[%0], %1\\n"))
            (emit-expr arg1)
            (emit-expr arg2)))

(define-primitive (car arg)
  (past::op '(@ (pasttype "inline")
                (inline "%r = %0.'key'()\\n"))
            (emit-expr arg)))

(define-primitive (cdr arg)
  (past::op '(@ (pasttype "inline")
                (inline "%r = %0.'value'()\\n"))
            (emit-expr arg)))

(define emit-comparison
  (lambda (builtin arg1 arg2)
    (past::op '(@ (pasttype "if"))
              (past::op `(@ (pasttype "chain")
                            (name ,builtin))
                        (emit-expr arg1)
                        (emit-expr arg2))
              (emit-expr #t)
              (emit-expr #f))))

;; comparison forms
(define-primitive (char< arg1 arg2)
  (emit-comparison "eclectus:<" arg1 arg2))

(define-primitive (char<= arg1 arg2)
  (emit-comparison "eclectus:<=" arg1 arg2))

(define-primitive (char= arg1 arg2)
  (emit-comparison "eclectus:==" arg1 arg2))

(define-primitive (char> arg1 arg2)
  (emit-comparison "eclectus:>" arg1 arg2))

(define-primitive (char>= arg1 arg2)
  (emit-comparison "eclectus:>=" arg1 arg2))

(define-primitive (fxzero? arg)
  (emit-comparison "eclectus:==" arg 0))

(define-primitive (fx< arg1 arg2)
  (emit-comparison "eclectus:<" arg1 arg2))

(define-primitive (fx<= arg1 arg2)
  (emit-comparison "eclectus:<=" arg1 arg2))

(define-primitive (fx= arg1 arg2)
  (emit-comparison "eclectus:==" arg1 arg2))

(define-primitive (fx>= arg1 arg2)
  (emit-comparison "eclectus:>=" arg1 arg2))

(define-primitive (fx> arg1 arg2)
  (emit-comparison "eclectus:>" arg1 arg2))

(define-primitive (eq? arg1 arg2)
  (emit-comparison "eq?" arg1 arg2))

(define-primitive (eqv? arg1 arg2)
  (emit-comparison "eqv?" arg1 arg2))

(define-primitive (equal? arg1 arg2)
  (emit-comparison "equal?" arg1 arg2))

(define-primitive (not arg)
  (emit-comparison "eq?" arg #f))

; asking for the type of an object
(define emit-typequery
  (lambda (typename arg)
    (past::op
      '(@ (pasttype "if"))
      (past::op
        `(@ (pasttype "inline")
            (inline ,(format #f "new %r, 'EclectusBoolean'\\nisa $I1, %0, '~a'\\n %r = $I1" typename)))
        (emit-expr arg))
      (emit-expr #t)
      (emit-expr #f))))
   
;; type queries
(define-primitive (boolean? arg)
  (emit-typequery "EclectusBoolean" arg))

(define-primitive (char? arg)
  (emit-typequery "EclectusCharacter" arg))

(define-primitive (null? arg)
  (emit-typequery "EclectusEmptyList" arg))

(define-primitive (fixnum? arg)
  (emit-typequery "EclectusFixnum" arg))

(define-primitive (pair? arg)
  (emit-typequery "EclectusPair" arg))

;; inout and output
(define-primitive (newline)
  (past::op '(@ (pasttype "call")
                (name "say"))))

(define emit-primcall
  (lambda (x)
    (let ((prim (lookup-primitive (car x))) (args (cdr x)))
      (apply (primitive-emitter prim) args))))

(define emit-functional-application
  (lambda (x)
    (append
      (past::op '(@ (pasttype "call"))
                (emit-expr (car x)))
      (map
       (lambda (arg)
         (emit-expr arg))
       (cdr x)))))

(define (emit-variable x)
  (past::var `(@ (name ,x)
                 (scope "lexical")
                 (viviself "Undef"))))

(define (emit-constant x)
  (cond
   ((fixnum? x)
    (past::val `(@ (value ,x)
                   (returns "EclectusFixnum"))))
   ((char? x)
    (past::val `(@ (value ,(char->integer x))
                   (returns "EclectusCharacter"))))
   ((null? x)
    (emit-global-ref "()"))
   ((boolean? x)
    (emit-global-ref (if x "#t" "#f")))
   ((string? x)
    (past::val `(@ (value (unquote (format #f "'~a'" x)))
                   (returns "EclectusString"))))
   ((vector? x)
    (past::val '(@ (value "'#0()'")
                   (returns "EclectusString"))))))


(define (emit-global-ref name)
  (past::op `(@ (pasttype "inline")
                (inline ,(format #f "%r = get_root_global ['_eclectus'], '~a'" name)))))

(define bindings
  (lambda (x)
    (cadr x)))

(define body
  (lambda (x)
    (caddr x)))

(define emit-variable
  (lambda (x)
    (past::var (quasiquote (@ (name (unquote x))
                              (scope "lexical")
                              (viviself "Undef"))))))

(define emit-if
  (lambda (x)
    (past::op
     '(@ (pasttype "if"))
     (emit-expr (if-test x))
     (emit-expr (if-conseq x))
     (emit-expr (if-altern x)))))

(define emit-lambda
  (lambda (x)  
    ; (write (list "all" x "decl" (cadr x) "stmts" (cddr x) ))(newline)
    (past::block
     (quasiquote (@ (blocktype "declaration")
                    (arity (unquote (length (cadr x))))))
     (past::stmts (map
                   (lambda (decl)
                     (past::var
                      (quasiquote (@ (name (unquote decl))
                                     (scope "parameter")))))
                   (cadr x)))
     (past::stmts (map
                   (lambda (stmt)
                     (emit-expr stmt))
                   (cddr x))))))

(define emit-begin
  (lambda (x)
    (past::stmts (map emit-expr (cdr x)))))

; emir PIR for an expression
(define emit-expr
  (lambda (x)
    ;(diag (format "emit-expr: ~s" x))
    (cond
      ((symbol? x)          (emit-variable x))
      ((quote? x)           (emit-constant (cadr x)))
      ((self-evaluating? x) (emit-constant x))
      ((if? x)              (emit-if x))
      ((begin? x)           (emit-begin x))
      ((lambda? x)          (emit-lambda x))
      ((primcall? x)        (emit-primcall x))
      (else                 (emit-functional-application x)))))

; eventually this will become a NQP generator
; for PAST as SXML
; currently it only handles the pushes
(define past-sxml->past-nqp
  (lambda (past)
    (if (symbol? (car past))
        (emit "
                ~a.new( 
              " (symbol->string (car past))))
    (for-each
       (lambda (daughter)
         (if (eq? '@ (car daughter))
           (for-each
             (lambda (key_val)
               (emit "
                     :~a(\"~a\"),
                     " (car key_val) (cadr key_val)))
             (cdr daughter))
           (begin
             (past-sxml->past-nqp daughter)
             (emit ","))))
       (cdr past))
    (emit ")")))

; print the result of the evaluation
(define wrap-say
  (lambda (past)
    (past::op
      '(@ (pasttype "call")
          (name "say"))
      past)))

;; Macro-expansion and alpha-conversion
(define (normalize-syntax program)
  (sexp/expand program (make-sexp-environment)))

; emit the PAST as a NQP subroutine
(define compile-program
  (lambda (program)
    (emit "sub scheme_entry () { " ) 
    (past-sxml->past-nqp
      (wrap-say
        (emit-expr (normalize-syntax program))))
    (emit "; }" ))) 
