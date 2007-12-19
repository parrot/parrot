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

  [(fixnum->char 65)                      => "#\\A\n" ]
  [(fixnum->char (fxsub1 66))             => "#\\A\n" ]
  [(fixnum->char (fxsub1 (fxsub1 67)))    => "#\\A\n" ]

  [(fxzero? 0)                            => "#t\n" ]
  [(fxzero? -1)                           => "#f\n" ]
  [(fxzero? 1)                            => "#f\n" ]
  [(fxzero? (char->fixnum #\A))           => "#f\n" ]

  [(null? ())                             => "#t\n" ]
  [(null? (fxsub1 1))                     => "#f\n" ]
  [(null? (fxsub1 10))                    => "#f\n" ]
  [(null? #\A)                            => "#f\n" ]
  [(null? 65)                             => "#f\n" ]
  [(null? (char->fixnum #\A))             => "#f\n" ]

  [(fixnum? ())                           => "#f\n" ]
  [(fixnum? (fxsub1 1))                   => "#t\n" ]
  [(fixnum? (fxsub1 10))                  => "#t\n" ]
  [(fixnum? #\A)                          => "#f\n" ]
  [(fixnum? 65)                           => "#t\n" ]
  [(fixnum? (char->fixnum #\A))           => "#t\n" ]
)

(test-all)
