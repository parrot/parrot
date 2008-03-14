; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "booleans"      
  [(pair? ())                    => "#f\n"]
  [(pair? #\A)                   => "#f\n"]
  [(pair? (fx+ 1 2))             => "#f\n"]
  [(pair? (pair? (fx+ 1 2)))     => "#f\n"]
  [(pair? (cons 30 31))          => "#t\n"]
  ; [(car   (cons 30 31))          => "30\n"]
  ; [(cdr   (cons 30 31))          => "31\n"]
)

(load "compiler.scm")
(test-all)
