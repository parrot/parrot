; $Id$

; This file in included by the scheme test scripts in t/*.t. It provides support
; for actually running the test cases set up in the *.t files.

(load "tap_helpers.scm")

(define all-tests '())

; Choose which scheme implementation should be tested.
; Choosing 'gauche' is meant for checking the test suite.
;(define implementation "gauche" )
(define implementation "gen_past_in_nqp" )         ; future default implementation

(define-syntax add-tests-with-string-output
  (syntax-rules (=>)
    ((_ test-name (expr => output-string) ...)
     (set! all-tests
        (cons
           '(test-name (expr string  output-string) ...)
            all-tests)))))

(define (test-one test-id test test-name)
  (let ((expr (car test))
        (type (cadr test))
        (out  (caddr test)))
    (flush-output-port)
    (case type
      ((string) (test-with-string-output test-id expr out test-name))
      (else     (error 'test "invalid test type ~s" type)))))
 
(define (test-all)
  (plan (length (cdar all-tests)))

  ;; run the tests
  (let f ((i 0) (ls (reverse all-tests)))
    (if (null? ls)
        (printf "")   ; XXX remove this
        (let ((x (car ls)) (ls (cdr ls)))
          (let* ((test-name (car x)) 
                 (tests (cdr x))
                 (n (length tests)))
            (let g ((i i) (tests tests))
              (cond
                ((null? tests)
                   (f i ls))
                (else
                  (test-one i (car tests) test-name)
                  (g (+ i 1) (cdr tests))))))))))

(define compile-port
  (make-parameter
    (current-output-port)
    (lambda (p)
       (unless (output-port? p) 
         (error 'compile-port "not an output port ~s" p))
       p)))

(define (run-compile expr nqp-fn)
  (cond 
    ( (string=? implementation "gauche")
      (with-output-to-file "stst.scm" (lambda () (write expr))))
    (else
      ; compile to NQP
      (let ((nqp-port (open-output-file nqp-fn 'replace)))
        (parameterize ((compile-port nqp-port))
          (compile-program expr))
        (close-output-port nqp-port)))))

; TODO: can I use (directory-separator) in gauche?
(define *path-to-parrot*
  (if (zero? (system "perl -e 'exit($^O eq q{MSWin32} ? 1 : 0)'"))
    "../../parrot"
    "..\\..\\parrot"))

(define (execute nqp-fn)
  (cond
    ( (string=? implementation "gauche")
      (unless (zero? (system "gosh -fcase-fold -I .  -l gauche/prelude.scm stst.scm > stst.out"))
        (error 'execute "produced program exited abnormally")))
    (else
      ; run NQP with driver_nqp.pbc
      (unless (zero? (system (string-append *path-to-parrot* " driver_nqp.pbc " nqp-fn " > stst.out")))
        (error 'execute "produced program exited abnormally")))))

(define (get-string)
  (with-output-to-string
    (lambda ()
      (with-input-from-file "stst.out"
        (lambda ()
          (let f ()
            (let ((c (read-char)))
              (cond
               ((not (eof-object? c))
                (display c)
                (f))))))))))

(define (test-with-string-output test-id expr expected-output test-name)
  (let ((nqp-fn (string-append "t/" test-name "_" (number->string test-id) ".nqp" )))
    (run-compile expr nqp-fn)
    (execute nqp-fn))
  (let ((actual-output (get-string)))
    (if (string=? expected-output actual-output)
      (pass ( + test-id 1 ) (format #f "~a: ~a" test-name expr))
      (fail ( + test-id 1 ) (format #f "~a: expected ~s, got ~s"
                                     test-name expected-output actual-output)))))

(define (emit . args)
  (apply fprintf (compile-port) args)
  (newline (compile-port)))
