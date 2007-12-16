; $Id$

(load "tests-driver.scm")
(load "compiler.scm")

(add-tests-with-string-output "unary primitives"      
  [(fxadd1 -2)                            => "-1\n" ]
  [(fxadd1 -1)                            => "0\n" ]
  [(fxadd1 1)                             => "2\n" ]
  [(fxadd1 2)                             => "3\n" ]
  [(fxsub1 -2)                            => "-3\n" ]
  [(fxsub1 -1)                            => "-2\n" ]
  [(fxsub1 1)                             => "0\n" ]
  [(fxsub1 2)                             => "1\n" ]
  [(char->fixnum #\A)                     => "65\n" ]
  [(fxsub1 (char->fixnum #\B))            => "65\n" ]
  [(fxsub1 (fxsub1 (char->fixnum #\C)))   => "65\n" ]
)

(test-all)
