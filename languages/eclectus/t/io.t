; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "io"
  ((newline)                   => "\n\n")                    
  ((begin (newline)(newline))  => "\n\n\n")                    
)

(load "compiler.scm")
(test-all)
