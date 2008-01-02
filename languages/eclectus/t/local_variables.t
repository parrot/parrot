; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "local variables"
  [(let() 13)                            => "13\n"]     
  [(let ((var-a 17)) 13)                 => "13\n"]     
  [(let ((var-a 17) (var-b 21)) 13)      => "13\n"]     
  [(let ((var-a 13) (var-b 21)) var-a)   => "13\n"]     
)

(load "compiler.scm")
(test-all)
