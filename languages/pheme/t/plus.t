(include_file lib/PhemeTest.pir)

(plan 2)

(is (+ 1 1) 2 "plus operator should add two numbers")

(is (+ 1 2 3 4 5) 15 "plus operator should add a list of numbers")

; (is (+ 1.1 2.2 3.3 4.4 5.5) 16.5 "... a list of floats too")
