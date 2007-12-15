; $Id$

(load "tests-driver.scm")
(load "compiler.scm")

(add-tests-with-string-output "fxadd1 and fxsub1"      
  [(fxadd1 -2)  => "-1\n" ]
  [(fxadd1 -1)  => "0\n" ]
  [(fxadd1 1)   => "2\n" ]
  [(fxadd1 2)   => "3\n" ]
  [(fxsub1 -2)  => "-3\n" ]
  [(fxsub1 -1)  => "-2\n" ]
  [(fxsub1 1)   => "0\n" ]
  [(fxsub1 2)   => "1\n" ])

(test-all)
