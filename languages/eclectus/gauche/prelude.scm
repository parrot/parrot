(use srfi-9)
(use gauche.parameter)
(use gauche.process)

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
  (hash-table-get tbl key default))

(define (hashtable-set! tbl key value)
  (hash-table-put! tbl key value))

(define (printf fmt . args)
  (apply format #t fmt args))

(define (fprintf port fmt . args)
  (apply format port fmt args))

(define (flush-output-port . port-opt)
  (apply flush port-opt))

(define open-output-file
  (let ((gauche:open-output-file open-output-file))
    (lambda (filename mode)
      (gauche:open-output-file filename))))

(define (system command)
  (process-exit-status (run-process (list "sh" "-c" command) :wait #t)))

(define (atom? x)
  (not (pair? x)))
