(use srfi-9)
(use srfi-1)

(load "riaxpander/chicken-sexp.scm")

(define-syntax unless
  (syntax-rules ()
    ((unless condition body1 body ...)
     (if (not condition)
         (begin body1 body ...)))))

(define (make-eq-hashtable)
  (make-hash-table eq?))

(define (hashtable-ref tbl key default)
  (hash-table-ref/default tbl key default))

(define (hashtable-set! tbl key value)
  (hash-table-set! tbl key value))

(define (printf fmt . args)
  (apply format #t fmt args))

(define (fprintf port fmt . args)
  (apply format port fmt args))

(define (flush-output-port . port-opt)
  (apply flush-output port-opt))

(define open-output-file
  (let ((chicken:open-output-file open-output-file))
    (lambda (filename mode)
      (chicken:open-output-file filename))))

(define (atom? x)
  (not (pair? x)))
