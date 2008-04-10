; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "equality"
  ((eq? #t #t)   => "#t\n")
  ((eq? #t #f)   => "#f\n")
  ((eq? '() '()) => "#t\n")

  ((eqv? #\A #\A) => "#t\n")
  ((eqv? 42 42)   => "#t\n")
)

(load "compiler.scm")
(test-all)
