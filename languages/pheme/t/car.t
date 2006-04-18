(include_file lib/PhemeTest.pir)

(plan 2)

(is
	(car (biz baz)) biz
	head-of-two-element-list-is-first-element)

(is
	(car (baz)) baz
	head-of-one-element-list-is-still-first-element)
