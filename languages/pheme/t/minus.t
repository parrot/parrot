(include_file lib/PhemeTest.pir)

(plan 4)

(is (- 77 7) 70 "minus operator should subtract first number from second")

(is (- 77.8 0.73) 77.07 "... for floats too")

(is (- 5000 495 5) 4500 "... for lists with more than 2 elements too")

(is (- 33.06 54.32 1 2 3.5) -27.76
    "... and for longer lists of floats with a negative result")
