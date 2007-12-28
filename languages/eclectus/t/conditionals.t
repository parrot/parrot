; $Id$

(load "tests-driver.scm")
(load "compiler.scm")

(add-tests-with-string-output "conditional expressions"      
  [(if #t 1 0)                            => "1\n" ]
  [(if #f 1 0)                            => "0\n" ]
  [(if 0 1 0)                             => "1\n" ]
  [(if 1 1 0)                             => "1\n" ]
  [(if #\A 1 0)                           => "1\n" ]
  [(if (fixnum? #\A) 1 0)                 => "0\n" ]
  [(if (char? #\A) 1 0)                   => "1\n" ]
  [(if (fixnum? #\A) 1 0)                 => "0\n" ]
  [(if (fixnum? 100) 1 0)                 => "1\n" ]
  [(if (and) 1 0)                         => "1\n" ]
  [(if (and #t) 1 0)                      => "1\n" ]
  [(if (and #f) 1 0)                      => "0\n" ]
  [(if (and #t #f) 1 0)                   => "0\n" ]
  [(if (and #t #t) 1 0)                   => "1\n" ]
)

(test-all)
