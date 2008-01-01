; $Id$

(load "tests-driver.scm") ; this should come first

(skip-all "local variables are not supported yet")

(add-tests-with-string-output "local variables"      
)

(load "compiler.scm")
(test-all)
