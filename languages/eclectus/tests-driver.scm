; $Id$

(load "tap_helpers.scm")

(define all-tests '())

(define run-with-petite #f)
;(define run-with-petite #t)

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
     (else (error 'test "invalid test type ~s" type)))))
 
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
                ((null? tests) (f i ls))
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

(define (run-compile expr)
  (if run-with-petite
    (with-output-to-file "stst.scm" (lambda () (write expr)))
    (let ((p (open-output-file "stst.pir" 'replace)))
      (parameterize ((compile-port p))
         (compile-program expr))
      (close-output-port p))))

; TODO: can I use (directory-separator) in petite?
(define *path-to-parrot*
  (if (zero? (system "perl -e \"exit($^O eq q{MSWin32} ? 1 : 0)\""))
    "../../parrot"
    "..\\..\\parrot"))

(define (execute)
  (if run-with-petite
    (unless (zero? (system "petite --script stst.scm > stst.out"))
      (error 'execute "produced program exited abnormally"))
    (unless (zero? (system (string-append *path-to-parrot* " stst.pir > stst.out")))
      (error 'execute "produced program exited abnormally"))))

(define (get-string)
  (with-output-to-string
    (lambda ()
      (with-input-from-file "stst.out"
        (lambda ()
          (let f ()
            (let ((c (read-char)))
              (cond
               ((eof-object? c) (void))
               (else (display c) (f))))))))))

(define (test-with-string-output test-id expr expected-output test-name)
   (run-compile expr)
   (execute)
   (if (string=? expected-output (get-string))
     (pass ( + test-id 1 ) (format #f "~a: ~a" test-name expr))
     (fail ( + test-id 1 ) (format #f "~a: expected ~s, got ~a" test-name expr (get-string) ))))

(define (emit . args)
  (apply fprintf (compile-port) args)
  (newline (compile-port)))
