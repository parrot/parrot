; $Id$

(load "tests-driver.scm") ; this should come first

(skip-all "strings are not supported yet")

(add-tests-with-string-output "strings"      
)

(load "compiler.scm")
(test-all)
