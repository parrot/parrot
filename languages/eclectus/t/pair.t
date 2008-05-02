; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "pair"      
  ((pair? '())                   => "#f\n")
  ((pair? #\A)                   => "#f\n")
  ((pair? (fx+ 1 2))             => "#f\n")
  ((pair? (pair? (fx+ 1 2)))     => "#f\n")
  ((pair? (cons 41 42))          => "#t\n")
  ((car   (cons 41 42))          => "41\n")
  ((cdr   (cons 41 42))          => "42\n")
)

(load "compiler.scm")
(test-all)
