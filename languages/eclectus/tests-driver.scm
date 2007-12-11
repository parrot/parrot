; $Id$

(define all-tests '())

(define-syntax add-tests-with-string-output
  (syntax-rules (=>)
    [(_ test-name [expr => output-string] ...)
     (set! all-tests
        (cons 
           '(test-name [expr string  output-string] ...)
            all-tests))]))

(define (run-compile expr)
  (let ([p (open-output-file "stst.pir" 'replace)])
    (compile-program expr p)
    (close-output-port p)))

(define (build) () )

(define (execute)
  (unless (zero? (system "./stst > stst.out"))
    (error 'make "produced program exited abnormally")))


(define (build-program expr)
   (run-compile expr)
   (build))

(define (get-string)
  (with-output-to-string
    (lambda ()
      (with-input-from-file "stst.out"
        (lambda ()
          (let f ()
            (let ([c (read-char)])
              (cond
               [(eof-object? c) (void)]
               [else (display c) (f)]))))))))

(define (test-with-string-output test-id expr expected-output)
   (run-compile expr)
   (build)
   (execute)
   (unless (string=? expected-output (get-string))
     (error 'test "output mismatch for test ~s, expected ~s, got ~s"
        test-id expected-output (get-string))))

(define (test-one test-id test test-name)
  (let ([expr (car test)]
        [type (cadr test)]
        [out  (caddr test)])
    (flush-output-port)
    (case type
     [(string) (test-with-string-output test-id expr out)]
     [else (error 'test "invalid test type ~s" type)])
    (printf "ok ~s - ~s ~s\n" ( + test-id 1 ) test-name expr )))
 
(define (plan all-tests)
  ( printf "~s..~s\n" 1 ( length (cdar all-tests))))

(define (test-all)
  ;; there has to be an easy way of getting the number of tests
  (plan all-tests)

  ;; run the tests
  (let f ([i 0] [ls (reverse all-tests)])
    (if (null? ls)
        (printf "")   ; XXX remove this
        (let ([x (car ls)] [ls (cdr ls)])
          (let* ([test-name (car x)] 
                 [tests (cdr x)]
                 [n (length tests)])
            (let g ([i i] [tests tests])
              (cond
                [(null? tests) (f i ls)]
                [else
                 (test-one i (car tests) test-name)
                 (g (add1 i) (cdr tests))])))))))


(define input-filter 
  (make-parameter (lambda (x) x)
    (lambda (x)
      (unless (procedure? x)
        (error 'input-filter "not a procedure ~s" x))
      x)))

(define runtime-file 
  (make-parameter
    "runtime.c"
    (lambda (fname)
      (unless (string? fname) (error 'runtime-file "not a string" fname))
      fname)))


(define compile-port
  (make-parameter
    (current-output-port)
    (lambda (p)
       (unless (output-port? p) 
         (error 'compile-port "not an output port ~s" p))
       p)))

(define show-compiler-output (make-parameter #f))

(define (run-compile expr)
  (let ([p (open-output-file "stst.pir" 'replace)])
    (parameterize ([compile-port p])
       (compile-program expr))
    (close-output-port p)))


(define (execute)
  (unless (fxzero? (system "../../parrot stst.pir > stst.out"))
    (error 'execute "produced program exited abnormally")))

(define (get-string)
  (with-output-to-string
    (lambda ()
      (with-input-from-file "stst.out"
        (lambda ()
          (let f ()
            (let ([c (read-char)])
              (cond
               [(eof-object? c) (void)]
               [else (display c) (f)]))))))))

(define (test-with-string-output test-id expr expected-output)
   (run-compile expr)
   (build)
   (execute)
   (unless (string=? expected-output (get-string))
     (error 'test "output mismatch for test ~s, expected ~s, got ~s"
        test-id expected-output (get-string))))

(define (emit . args)
  (apply fprintf (compile-port) args)
  (newline (compile-port)))
