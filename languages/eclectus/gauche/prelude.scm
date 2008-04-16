(use srfi-9)
(use gauche.parameter)
(use gauche.process)

(load "riaxpander/gauche.scm")
(import riaxpander)

(define-syntax unless
  (syntax-rules ()
    ((unless condition body1 body ...)
     (if (not condition)
         (begin body1 body ...)))))

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
  ; use the deprecated syntax or run-process for now
  ; (process-exit-status (run-process (list "sh" "-c" command) :wait #t)))
  (process-exit-status (run-process "/bin/sh" "-c" command :wait #t)))

(define (atom? x)
  (not (pair? x)))
