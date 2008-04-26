; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "booleans"      
  (#t  => "#t\n")                    
  (#f  => "#f\n"))

(load "compiler.scm")
(test-all)
