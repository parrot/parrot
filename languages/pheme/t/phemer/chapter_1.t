(include_file lib/PhemeTest.pir)

(plan 6)

(is (car (a b c)) a "car of (a b c) should be a")

(is
	(car
		((a b c) x y z))
	(a b c)
	"car of ((a b c) x y z) should be (a b c)")

(is (car ()) "nil" "car of empty list should be nil")

(is_deeply
	(car
		(((hotdogs)) (and) (pickle) relish))
	((hotdogs))
	"car of list of double-nested lists should be double-nested list")

(is_deeply
 	(cdr ((a b c) x y z))
 	(x y z)
 	"cdr of list of lists should be second part" )

(is_deeply (cdr (hamburger)) () "cdr of one-element list should be empty list")
