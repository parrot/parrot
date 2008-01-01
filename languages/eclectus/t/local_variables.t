; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "local variables"      
)

(load "compiler.scm")
(test-all)
