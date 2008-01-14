; $Id$

(load "tests-driver.scm") ; this should come first

(skip-all "vectors are not supported yet")

(add-tests-with-string-output "vectors"      
)

(load "compiler.scm")
(test-all)
