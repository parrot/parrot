; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "booleans"      
  [(pair? ())                    => "#f\n"]
  [(pair? #\A)                   => "#f\n"]
  [(pair? (fx+ 1 2))             => "#f\n"]
  [(pair? (pair? (fx+ 1 2)))     => "#f\n"]
  [(pair? (cons 30 31))          => "#t\n"]
)

(load "compiler.scm")
(test-all)
