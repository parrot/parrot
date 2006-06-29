(include_file lib/PhemeTest.pir)

(plan 2)

(is (- 77 7) 70 "minus operator should subtract first number from second")

(is (- 77.8 0.73) 77.07 "... for floats too")
