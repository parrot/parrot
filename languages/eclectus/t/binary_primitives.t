; $Id$

(load "tests-driver.scm")
(load "compiler.scm")

(add-tests-with-string-output "binary primitives"      
  [(fx+ 1 13)                                   => "14\n" ]
  [(fx+ 1 (fx+ 7 6))                            => "14\n" ]
  [(fx+ 1 (fx+ 7 (fxadd1 5)))                   => "14\n" ]
  [(fx+ 1 (fx+ (fxsub1 8) (fxadd1 5)))          => "14\n" ]
  [(fx+ 1 (fx+ (fx+ 4 3) 6))                    => "14\n" ]
  [(fx+ 1 (fx+ (fx+ 4 3) (fx+ 3 3)))            => "14\n" ]
  [(fx+ (fx+ -10 11) (fx+ (fx+ 4 3) (fx+ 3 3))) => "14\n" ]

  [(fx- 1 13)                                   => "-12\n" ]
  [(fx- 1 (fx- 7 6))                            => "0\n" ]
  [(fx- 1 (fx- 7 (fxadd1 5)))                   => "0\n" ]
  [(fx- 1 (fx- (fxsub1 8) (fxadd1 5)))          => "0\n" ]
  [(fx- 1 (fx- (fx- 4 3) 6))                    => "6\n" ]
  [(fx- 1 (fx- (fx- 4 3) (fx- 3 3)))            => "0\n" ]
  [(fx- (fx- -10 11) (fx- (fx- 4 3) (fx- 3 3))) => "-22\n" ]

  [(fx- 1 (fx+ 7 6))                            => "-12\n" ]
  [(fx- 1 (fx+ 7 (fxadd1 5)))                   => "-12\n" ]
  [(fx+ 1 (fx- (fxsub1 8) (fxadd1 5)))          => "2\n" ]
  [(fx- 1 (fx+ (fx- 4 3) 6))                    => "-6\n" ]
  [(fx+ 1 (fx- (fx- 4 3) (fx+ 3 3)))            => "-4\n" ]
  [(fx- (fx+ -10 11) (fx+ (fx+ 4 3) (fx- 3 3))) => "-6\n" ]
)

(test-all)
