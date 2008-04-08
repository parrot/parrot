(use-modules (ice-9 syncase)
             (srfi srfi-39)
             (srfi srfi-9))

(define (load filename)
  (primitive-load filename))

(define-syntax unless
  (syntax-rules ()
    ((unless condition body1 body ...)
     (if (not condition)
         (begin body1 body ...)))))

(define-macro (define-record name fields)
  (define (symbol-append . symbols)
    (string->symbol (apply string-append (map symbol->string symbols))))
  `(define-record-type name
     (,(symbol-append 'make- name) ,@fields)
     ,(symbol-append name '?)
     ,@(map (lambda (field)
              `(,field ,(symbol-append name '- field)))
            fields)))

(define (make-eq-hashtable)
  (make-hash-table))

(define (hashtable-ref tbl key default)
  (hashq-ref tbl key default))

(define (hashtable-set! tbl key value)
  (hashq-set! tbl key value))

(define (printf fmt . args)
  (apply format #t fmt args))

(define (fprintf port fmt . args)
  (apply format port fmt args))

(define (flush-output-port . port-opt)
  (apply force-output port-opt))

(define (open-output-file filename mode)
  (open-file filename (case mode
                        ((replace) "w")
                        (else (error "invalid file mode" mode)))))

(define (atom? x)
  (not (pair? x)))

(define (fixnum? x)
  (integer? x)) ;; FIXME: This is a gross approximation
