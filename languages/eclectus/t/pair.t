; $Id$

(load "tests-driver.scm") ; this should come first

(skip-all "pairs are not supported yet")

(add-tests-with-string-output "booleans"      
  [(pair? (cons 30 31))  => "#t\n"]
  [(pair? ())            => "#f\n"]
  [(pair? #\A)           => "#f\n"])

(load "compiler.scm")
(test-all)
