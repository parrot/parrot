; $Id$

(load "tests-driver.scm") ; this should come first

(add-tests-with-string-output "procedures"
  (((lambda () 18))                                       => "18\n")     
  (((lambda () (fx- 20 2)))                               => "18\n")     
  (((lambda () (fx- 36 (fx- 20 2))))                      => "18\n")     
  (((lambda (arg) arg) 18)                                => "18\n")     
  (((lambda (arg) (fx+ arg 8)) 10)                        => "18\n")     
  (((lambda (arg1 arg2) (fx+ arg1 arg2)) 8 10)            => "18\n")     
)

(load "compiler.scm")
(test-all)
