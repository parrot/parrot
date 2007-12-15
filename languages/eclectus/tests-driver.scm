; $Id$

(define all-tests '())

(define-syntax add-tests-with-string-output
  (syntax-rules (=>)
    [(_ test-name [expr => output-string] ...)
     (set! all-tests
        (cons 
           '(test-name [expr string  output-string] ...)
            all-tests))]))

(define (test-one test-id test test-name)
  (let ([expr (car test)]
        [type (cadr test)]
        [out  (caddr test)])
    (flush-output-port)
    (case type
     [(string) (test-with-string-output test-id expr out)]
     [else (error 'test "invalid test type ~s" type)])))
 
(define (test-plan num-tests)
  ( printf "~s..~s\n" 1 num-tests ))

(define (test-all)
  ;; there has to be an easy way of getting the number of tests
  (test-plan (length (cdar all-tests)))

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


(define compile-port
  (make-parameter
    (current-output-port)
    (lambda (p)
       (unless (output-port? p) 
         (error 'compile-port "not an output port ~s" p))
       p)))

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
   (execute)
   (if (string=? expected-output (get-string))
     (printf "ok ~s - ~s\n" ( + test-id 1 ) expr )
     (printf "not ok ~s - expected ~s, got ~s\n" ( + test-id 1 ) expr (get-string) )))

(define (emit . args)
  (apply fprintf (compile-port) args)
  (newline (compile-port)))
