; $Id$

(load "tests-driver.scm")
(load "compiler.scm")

(add-tests-with-string-output "unary primitives"      
  [(fx+ 1 13)                            => "14\n" ]
  [(fx+ 1 (fx+ 7 6))                     => "7\n" ]
  [(fx+ 1 (fx+ 4 3) 6)                   => "14\n" ]
  [(fx+ 1 (fx+ 4 3) (fx+ 3 3))           => "14\n" ]
)

(test-all)
