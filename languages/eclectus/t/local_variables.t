; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "local variables"
  [(let() 13)      => "13\n"]     
)

(load "compiler.scm")
(test-all)
