(include_file lib/PhemeTest.pir)

(plan 3)

(is
	(cons banana (and honey sandwich))
	(banana and honey sandwich)
	cons-of-atom-to-list-should-add-atom-to-list-head)

(is
	(car (cons banana (and honey sandwich)))
	banana
	cons-of-atom-to-list-should-add-atom-to-list-head)

(is
	(car (cons (banana) (and honey sandwich)))
	(banana)
	cons-of-list-to-list-should-add-list-to-list-head)
