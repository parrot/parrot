; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "integers"      
)

(load "compiler.scm")
(test-all)
