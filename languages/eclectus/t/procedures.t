; $Id$

(load "tests-driver.scm") ; this should come first

(skip-all "procedures are not supported yet")

(add-tests-with-string-output "local variables"
  [((lambda () 18)))                                       => "18\n"]     
)

(load "compiler.scm")
(test-all)
